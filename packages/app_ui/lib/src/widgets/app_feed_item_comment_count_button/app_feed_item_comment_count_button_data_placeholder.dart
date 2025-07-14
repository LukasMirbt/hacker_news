import 'package:app_ui/app_ui.dart';

class AppFeedItemCommentCountButtonDataPlaceholder
    extends AppFeedItemCommentCountButtonData {
  AppFeedItemCommentCountButtonDataPlaceholder({
    String? commentCount,
    void Function()? onPressed,
  }) : super(
         commentCount: commentCount ?? 'commentCount',
         onPressed: onPressed ?? () {},
       );
}
