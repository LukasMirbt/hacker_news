import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

import '../../app/pump_app.dart';

class _MockThreadCommentOptionsBloc
    extends MockBloc<ThreadCommentOptionsEvent, ThreadCommentOptionsState>
    implements ThreadCommentOptionsBloc {}

void main() {
  final comment = OtherUserThreadCommentModel(
    OtherUserThreadCommentPlaceholder(),
  );

  group(OtherUserThreadCommentOptionsBody, () {
    late ThreadCommentOptionsBloc bloc;

    setUp(() {
      bloc = _MockThreadCommentOptionsBloc();
      when(() => bloc.state).thenReturn(
        ThreadCommentOptionsState(comment: comment),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: OtherUserThreadCommentOptionsBody(comment),
      );
    }

    testWidgets('renders $AppBottomSheet', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppBottomSheet), findsOneWidget);
    });

    testWidgets('renders $ReplyOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ReplyOption), findsOneWidget);
    });

    testWidgets('renders $ViewPostOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ViewPostOption), findsOneWidget);
    });

    testWidgets('renders $ShareOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(ShareOption), findsOneWidget);
    });

    testWidgets('renders $OpenOnWebOption', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(OpenOnWebOption), findsOneWidget);
    });
  });
}
