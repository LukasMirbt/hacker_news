import 'package:app_ui/app_ui.dart';

class AppCurrentUserCommentDataPlaceholder extends AppCurrentUserCommentData {
  AppCurrentUserCommentDataPlaceholder({
    bool? isExpanded,
    String? user,
    String? age,
    String? htmlText,
    String? score,
    void Function()? onHeaderPressed,
    void Function()? onMorePressed,
    void Function(String)? onLinkPressed,
  }) : super(
         isExpanded: isExpanded ?? false,
         user: user ?? 'user',
         age: age ?? 'age',
         htmlText: htmlText ?? 'htmlText',
         score: score ?? 'score',
         onHeaderPressed: onHeaderPressed ?? () {},
         onMorePressed: onMorePressed ?? () {},
         onLinkPressed: onLinkPressed ?? (_) {},
       );
}
