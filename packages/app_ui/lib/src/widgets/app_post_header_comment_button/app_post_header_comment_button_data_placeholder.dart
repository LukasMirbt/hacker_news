import 'package:app_ui/app_ui.dart';

class AppPostHeaderCommentButtonDataPlaceholder
    extends AppPostHeaderCommentButtonData {
  AppPostHeaderCommentButtonDataPlaceholder({
    String? commentCount,
    void Function()? onPressed,
  }) : super(
         commentCount: commentCount ?? 'commentCount',
         onPressed: onPressed ?? () {},
       );
}
