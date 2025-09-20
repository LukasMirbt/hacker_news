import 'package:app/thread_feed/thread_feed.dart';
import 'package:thread_repository/thread_repository.dart';

class OtherUserThreadCommentModelPlaceholder
    extends OtherUserThreadCommentModel {
  OtherUserThreadCommentModelPlaceholder(int index)
    : super(
        comment: OtherUserThreadCommentPlaceholder(
          indent: index % 3,
          age: DateTime(1),
          hnuser: const HnuserPlaceholder(),
          htmlText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Praesent vel urna vitae sapien ullamcorper facilisis. '
              'Phasellus sit amet sapien non elit tincidunt euismod.',
        ),
      );
}
