// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockDraftBloc extends MockBloc<DraftEvent, DraftState>
    implements DraftBloc {}

class _MockDraftState extends Mock implements DraftState {}

class _MockDraftBuilder extends Mock implements DraftBuilder {}

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  final drafts = List.filled(
    10,
    CommentDraftModel(
      draft: CommentDraftPlaceholder(),
    ),
  );

  final item = Container();

  group(DraftBody, () {
    late DraftBloc bloc;
    late DraftState state;
    late DraftBuilder builder;

    setUp(() {
      bloc = _MockDraftBloc();
      state = _MockDraftState();
      builder = _MockDraftBuilder();
      registerFallbackValue(_MockBuildContext());
      when(() => bloc.state).thenReturn(state);
      when(() => state.drafts).thenReturn(drafts);
      when(() => builder.itemBuilder(any(), any())).thenAnswer((_) => item);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: DraftBody(builder: builder),
      );
    }

    testWidgets('has correct itemBuilder', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(
        find.byWidget(item, skipOffstage: false),
        findsNWidgets(drafts.length),
      );
    });
  });
}
