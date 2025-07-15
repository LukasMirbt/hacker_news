import 'package:app_ui/app_ui.dart';

class AppPostHeaderVoteButtonDataPlaceholder
    extends AppPostHeaderVoteButtonData {
  AppPostHeaderVoteButtonDataPlaceholder({
    bool? hasBeenUpvoted,
    String? score,
    void Function()? onPressed,
  }) : super(
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         score: score ?? 'score',
         onPressed: onPressed ?? () {},
       );
}
