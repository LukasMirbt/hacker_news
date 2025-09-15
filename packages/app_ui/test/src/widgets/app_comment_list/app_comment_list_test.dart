// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app_ui/app_ui.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

class _TestComment implements Collapsible<dynamic> {
  _TestComment();

  @override
  final int indent = 0;

  @override
  final String id = 'id';

  @override
  final bool isExpanded = false;

  @override
  final bool isParentExpanded = false;

  @override
  _TestComment copyWith({
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return this;
  }
}

void main() {
  final containerBuilder =
      (
        BuildContext context,
        ItemBuilder itemBuilder,
      ) => itemBuilder(context, 1);

  final commentBuilder = (_, _) => Container();

  group(AppCommentList, () {
    late AppCommentListData data;

    setUp(() {
      data = AppCommentListData(
        containerBuilder: containerBuilder,
        commentBuilder: commentBuilder,
        items: [
          _TestComment(),
          _TestComment(),
        ],
      );
    });

    Widget buildSubject() {
      return AppCommentList(data: data);
    }

    testWidgets('renders $CommentListItem', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListItem), findsOneWidget);
    });

    testWidgets('renders $CommentListDivider', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListDivider), findsOneWidget);
    });

    testWidgets('renders $CommentListFooter', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CommentListFooter), findsOneWidget);
    });
  });
}
