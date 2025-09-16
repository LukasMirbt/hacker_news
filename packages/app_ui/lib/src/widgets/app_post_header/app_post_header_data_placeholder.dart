import 'package:app_ui/app_ui.dart';

class AppPostHeaderDataPlaceholder extends AppPostHeaderData {
  AppPostHeaderDataPlaceholder({
    bool? hasBeenVisited,
    String? title,
    String? age,
    String? urlHost,
    String? user,
    void Function(String)? onTextLinkPressed,
    void Function()? onPressed,
    void Function()? onSharePressed,
    void Function()? onMorePressed,
    super.htmlText,
    super.voteButton,
    super.commentButton,
  }) : super(
         hasBeenVisited: hasBeenVisited ?? false,
         title: title ?? 'title',
         age: age ?? 'age',
         urlHost: urlHost ?? 'urlHost',
         user: user ?? 'user',
         onTextLinkPressed: onTextLinkPressed ?? (_) {},
         onPressed: onPressed ?? () {},
         onSharePressed: onSharePressed ?? () {},
         onMorePressed: onMorePressed ?? () {},
       );
}
