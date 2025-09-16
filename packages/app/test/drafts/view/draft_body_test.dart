// ignore_for_file: prefer_const_constructors

import 'package:app/drafts/drafts.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftBloc extends MockBloc<DraftEvent, DraftState>
    implements DraftBloc {}

class _MockDraftState extends Mock implements DraftState {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final drafts = List.filled(
    10,
    CommentDraftModel(
      draft: CommentDraftPlaceholder(),
    ),
  );

  group(DraftBody, () {
    late DraftBloc bloc;
    late DraftState state;

    setUp(() {
      bloc = _MockDraftBloc();
      state = _MockDraftState();
      registerFallbackValue(_MockBuildContext());
      when(() => bloc.state).thenReturn(state);
      when(() => state.drafts).thenReturn(drafts);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: DraftBody(),
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

      testWidgets('has correct itemCount', (tester) async {
        await tester.pumpApp(buildSubject());
        final delegate = findDelegate(tester);
        expect(delegate.childCount, drafts.length);
      });

      testWidgets('has correct itemBuilder', (tester) async {
        const index = 1;
        await tester.pumpApp(buildSubject());
        final delegate = findDelegate(tester);
        final context = _MockBuildContext();
        expect(
          delegate.builder(context, index),
          isA<DraftItem>().having(
            (item) => item.index,
            'index',
            index,
          ),
        );
      });
    });
  });
}
