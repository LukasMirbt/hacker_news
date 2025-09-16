// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockPostHeaderBloc extends MockBloc<PostHeaderEvent, PostHeaderState>
    implements PostHeaderBloc {}

class _MockPostHeaderState extends Mock implements PostHeaderState {}

class _MockPostHeaderModel extends Mock implements PostHeaderModel {}

class _MockScrollController extends Mock implements ScrollController {}

class _MockScrollAnimator extends Mock implements ScrollAnimator {}

void main() {
  const title = 'title';
  const offset = 1.0;
  const double minOffset = 125;
  const greaterThanMinOffset = minOffset + 1;

  group(PostAppBarTitle, () {
    late PostHeaderBloc bloc;
    late PostHeaderState state;
    late PostHeaderModel header;
    late ScrollController controller;
    late ScrollAnimator scrollAnimator;

    setUp(() {
      bloc = _MockPostHeaderBloc();
      state = _MockPostHeaderState();
      header = _MockPostHeaderModel();
      controller = _MockScrollController();
      scrollAnimator = _MockScrollAnimator();
      when(() => bloc.state).thenReturn(state);
      when(() => state.header).thenReturn(header);
      when(() => header.title).thenReturn(title);
      when(() => controller.offset).thenReturn(offset);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: ListenableProvider.value(
          value: controller,
          child: PostAppBarTitle(
            scrollAnimator: scrollAnimator,
          ),
        ),
      );
    }

    testWidgets(
      'calls jumpTo when tapped and duration '
      'is zero',
      (tester) async {
        final durationMethod = () => scrollAnimator.duration(offset);
        when(durationMethod).thenReturn(Duration.zero);
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(PostAppBarTitle));
        verify(durationMethod).called(1);
        verify(() => controller.jumpTo(0)).called(1);
      },
    );

    testWidgets(
      'calls animateTo when tapped and duration '
      'is non-zero',
      (tester) async {
        final duration = Duration(milliseconds: 300);
        final durationMethod = () => scrollAnimator.duration(offset);
        final animateTo = () => controller.animateTo(
          0,
          duration: duration,
          curve: Curves.easeOut,
        );
        when(durationMethod).thenReturn(duration);
        when(animateTo).thenAnswer((_) async {});
        await tester.pumpApp(buildSubject());
        await tester.tap(find.byType(PostAppBarTitle));
        verify(durationMethod).called(1);
        verify(animateTo).called(1);
      },
    );

    group(AnimatedOpacity, () {
      AnimatedOpacity findWidget(WidgetTester tester) {
        return tester.widget<AnimatedOpacity>(
          find.byType(AnimatedOpacity),
        );
      }

      void Function() captureListener() {
        return verify(
              () => controller.addListener(captureAny()),
            ).captured.last
            as void Function();
      }

      testWidgets('has correct opacity when offset '
          'is less than minOffset initially', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.opacity, 0);
      });

      testWidgets('has correct opacity when offset '
          'is greater than minOffset initially', (tester) async {
        when(() => controller.offset).thenReturn(
          greaterThanMinOffset,
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.opacity, 1);
      });

      testWidgets('has correct opacity when offset '
          'changes to greater than minOffset', (tester) async {
        await tester.pumpApp(buildSubject());
        var widget = findWidget(tester);
        expect(widget.opacity, 0);
        final listener = captureListener();
        when(() => controller.offset).thenReturn(
          greaterThanMinOffset,
        );
        listener();
        await tester.pump();
        widget = findWidget(tester);
        expect(widget.opacity, 1);
      });

      testWidgets('has correct opacity when offset '
          'changes to less than minOffset', (tester) async {
        when(() => controller.offset).thenReturn(
          greaterThanMinOffset,
        );
        await tester.pumpApp(buildSubject());
        var widget = findWidget(tester);
        expect(widget.opacity, 1);
        final listener = captureListener();
        when(() => controller.offset).thenReturn(0);
        listener();
        await tester.pump();
        widget = findWidget(tester);
        expect(widget.opacity, 0);
      });

      testWidgets('has correct curve', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.curve, Curves.easeInOut);
      });

      testWidgets('has correct duration', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.duration,
          Duration(milliseconds: 150),
        );
      });
    });

    testWidgets('renders title', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.text(title), findsOneWidget);
    });
  });
}
