import 'package:app_ui/app_ui.dart';

class AppThreadItemDataPlaceholder extends AppThreadItemData {
  AppThreadItemDataPlaceholder({
    bool? isExpanded,
    int? indent,
    String? user,
    String? age,
    bool? hasBeenUpvoted,
    String? htmlText,
    void Function()? onHeaderPressed,
    void Function()? onMorePressed,
    void Function(String)? onLinkPressed,
    void Function()? onVotePressed,
  }) : super(
         isExpanded: isExpanded ?? false,
         indent: indent ?? 1,
         user: user ?? 'user',
         age: age ?? 'age',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         htmlText: htmlText ?? 'htmlText',
         onHeaderPressed: onHeaderPressed ?? () {},
         onMorePressed: onMorePressed ?? () {},
         onLinkPressed: onLinkPressed ?? (_) {},
         onVotePressed: onVotePressed ?? () {},
       );
}
