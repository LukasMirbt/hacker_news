// ignore_for_file: prefer_const_constructors
// ignore_for_file: cascade_invocations

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/helpers.dart';

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  const itemCount = 30;
  const fetchTriggerOffset = 5;

  final item = SizedBox(height: 100);
  final placeholder = SizedBox(height: 100);
  final footer = SizedBox(height: 50);

  group(AppPaginatedList, () {
    late BuildContext context;

    setUp(() {
      context = _MockBuildContext();
    });

    Widget buildSubject({
      required int itemCount,
      bool? isLoading,
      bool? hasReachedMax,
      Widget? Function(BuildContext, int)? itemBuilder,
      Widget Function(BuildContext, int)? placeholderBuilder,
      Widget Function(BuildContext)? footerBuilder,
      void Function()? onFetchData,
      Widget Function(BuildContext, int)? separatorBuilder,
    }) {
      return AppPaginatedList(
        itemCount: itemCount,
        isLoading: isLoading ?? false,
        hasReachedMax: hasReachedMax ?? false,
        itemBuilder: itemBuilder ?? (_, _) => item,
        placeholderBuilder: placeholderBuilder ?? (_, _) => placeholder,
        footerBuilder: footerBuilder ?? (_) => footer,
        onFetchData: onFetchData ?? () {},
        separatorBuilder: separatorBuilder,
      );
    }

    group(ListView, () {
      ListView findWidget(WidgetTester tester) {
        return tester.widget<ListView>(
          find.byType(ListView),
        );
      }

      SliverChildBuilderDelegate findDelegate(WidgetTester tester) {
        final widget = findWidget(tester);
        return widget.childrenDelegate as SliverChildBuilderDelegate;
      }

      group('has correct itemCount', () {
        testWidgets('when hasReachedMax', (tester) async {
          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              hasReachedMax: true,
            ),
          );
          final delegate = findDelegate(tester);
          expect(delegate.childCount, itemCount + 1);
        });

        testWidgets('when !hasReachedMax', (tester) async {
          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              hasReachedMax: false,
            ),
          );
          final delegate = findDelegate(tester);
          expect(delegate.childCount, itemCount + 100);
        });
      });

      group('itemBuilder', () {
        testWidgets('calls onFetchData in post frame callback '
            'when !isLoading and !hasReachedMax '
            'and !fetchHasBeenTriggered', (tester) async {
          var calls = 0;

          void onFetchData() {
            calls += 1;
          }

          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              onFetchData: onFetchData,
            ),
          );

          final delegate = findDelegate(tester);
          delegate.build(context, itemCount - fetchTriggerOffset);
          await tester.pump();
          expect(calls, 1);
        });

        testWidgets('resets fetchHasBeenTriggered '
            'when itemCount changes', (tester) async {
          var calls = 0;
          var currentItemCount = 30;

          void onFetchData() {
            calls += 1;
          }

          await tester.pumpApp(
            buildSubject(
              itemCount: currentItemCount,
              onFetchData: onFetchData,
            ),
          );

          final delegate = findDelegate(tester);

          delegate.build(context, currentItemCount - fetchTriggerOffset);
          await tester.pump();
          expect(calls, 1);

          currentItemCount += 30;

          await tester.pumpApp(
            buildSubject(
              itemCount: currentItemCount,
              onFetchData: onFetchData,
            ),
          );

          final newDelegate = findDelegate(tester);

          newDelegate.build(context, currentItemCount - fetchTriggerOffset);

          await tester.pump();
          expect(calls, 2);
        });

        testWidgets('does not call onFetchData in post frame callback '
            'when !isLoading and !hasReachedMax '
            'and fetchHasBeenTriggered', (tester) async {
          var calls = 0;

          void onFetchData() {
            calls += 1;
          }

          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              onFetchData: onFetchData,
            ),
          );

          final delegate = findDelegate(tester);
          delegate.build(context, itemCount - fetchTriggerOffset);
          await tester.pump();

          delegate.build(context, itemCount - fetchTriggerOffset);
          await tester.pump();

          expect(calls, 1);
        });

        testWidgets('does not call onFetchData in post frame callback '
            'when isLoading and !hasReachedMax '
            'and !fetchHasBeenTriggered', (tester) async {
          var calls = 0;

          void onFetchData() {
            calls += 1;
          }

          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              onFetchData: onFetchData,
              isLoading: true,
            ),
          );

          final delegate = findDelegate(tester);
          delegate.build(context, itemCount - fetchTriggerOffset);
          await tester.pump();

          expect(calls, 0);
        });

        testWidgets('does not call onFetchData in post frame callback '
            'when !isLoading and hasReachedMax '
            'and !fetchHasBeenTriggered', (tester) async {
          var calls = 0;

          void onFetchData() {
            calls += 1;
          }

          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              onFetchData: onFetchData,
              hasReachedMax: true,
            ),
          );

          final delegate = findDelegate(tester);
          delegate.build(context, itemCount - fetchTriggerOffset);
          await tester.pump();

          expect(calls, 0);
        });

        testWidgets('renders correct items '
            'when index < itemCount', (tester) async {
          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
            ),
          );
          expect(find.byWidget(item), findsNWidgets(6));
          expect(find.byWidget(placeholder), findsNothing);
          expect(find.byWidget(footer), findsNothing);
        });

        testWidgets('renders correct items '
            'when index >= itemCount and hasReachedMax', (tester) async {
          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              hasReachedMax: true,
            ),
          );
          await tester.scrollUntilVisible(
            find.byWidget(footer),
            item.height!,
          );
          expect(find.byWidget(item), findsNWidgets(6));
          expect(find.byWidget(placeholder), findsNothing);
          expect(find.byWidget(footer), findsOneWidget);
        });

        testWidgets('renders correct items '
            'when index >= itemCount and !hasReachedMax', (tester) async {
          await tester.pumpApp(
            buildSubject(
              itemCount: itemCount,
              isLoading: true,
              hasReachedMax: false,
            ),
          );
          await tester.scrollUntilVisible(
            find.byWidget(placeholder),
            item.height!,
          );
          expect(find.byWidget(item), findsNWidgets(5));
          expect(find.byWidget(placeholder), findsNWidgets(1));
          expect(find.byWidget(footer), findsNothing);
        });
      });

      testWidgets('renders separators when separatorBuilder '
          'is non-null', (tester) async {
        final separator = SizedBox(height: 20);
        await tester.pumpApp(
          buildSubject(
            itemCount: itemCount,
            separatorBuilder: (_, __) => separator,
          ),
        );
        expect(
          find.byWidget(separator),
          findsNWidgets(5),
        );
        expect(
          find.byWidget(item),
          findsNWidgets(5),
        );
      });
    });
  });
}
