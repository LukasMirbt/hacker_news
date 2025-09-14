import 'package:app_ui/app_ui.dart';

class AppPostHeaderDataPlaceholder extends AppPostHeaderData {
  AppPostHeaderDataPlaceholder({
    bool? hasBeenVisited,
    String? title,
    String? age,
    String? urlHost,
    String? user,
    void Function()? onPressed,
    void Function(String)? onTextLinkPressed,
    void Function()? onUrlHostPressed,
    void Function()? onUserPressed,
    void Function()? onSharePressed,
    super.htmlText,
    super.voteButton,
    super.commentButton,
  }) : super(
         hasBeenVisited: hasBeenVisited ?? false,
         title: title ?? 'title',
         age: age ?? 'age',
         urlHost: urlHost ?? 'urlHost',
         user: user ?? 'user',
         onPressed: onPressed ?? () {},
         onUrlHostPressed: onUrlHostPressed ?? () {},
         onUserPressed: onUserPressed ?? () {},
         onTextLinkPressed: onTextLinkPressed ?? (_) {},
         onSharePressed: onSharePressed ?? () {},
       );
}
