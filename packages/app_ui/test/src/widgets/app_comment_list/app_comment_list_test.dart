import 'package:app_ui/app_ui.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

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
  group(AppCommentList, () {
    late ListController listController;
    late AppCommentListData data;

    setUp(() {
      listController = ListController();
      data = AppCommentListData(
        listController: listController,
        selectedIndex: null,
        items: [
          _TestComment(),
          _TestComment(),
        ],
        commentBuilder: (_, __) => Container(),
      );
    });

    tearDown(() {
      listController.dispose();
    });

    Widget buildSubject() {
      return CustomScrollView(
        slivers: [
          AppCommentList(data: data),
        ],
      );
    }

    group(SuperSliverList, () {
      group('itemBuilder', () {
        Future<Widget> buildItem(WidgetTester tester) async {
          await tester.pumpApp(buildSubject());

          final widget = tester.widget<SuperSliverList>(
            find.byType(SuperSliverList),
          );

          final delegate = widget.delegate as SliverChildBuilderDelegate;

          return Provider.value(
            value: data,
            child: Builder(
              builder: (context) => delegate.builder(context, 1)!,
            ),
          );
        }

        testWidgets('renders $CommentListItem', (tester) async {
          final item = await buildItem(tester);
          await tester.pumpApp(item);
          expect(find.byType(CommentListItem), findsOneWidget);
        });

        testWidgets('renders $CommentListDivider', (tester) async {
          final item = await buildItem(tester);
          await tester.pumpApp(item);
          expect(find.byType(CommentListDivider), findsOneWidget);
        });

        testWidgets('renders $CommentListFooter', (tester) async {
          final item = await buildItem(tester);
          await tester.pumpApp(item);
          expect(find.byType(CommentListFooter), findsOneWidget);
        });
      });
    });
  });
}
