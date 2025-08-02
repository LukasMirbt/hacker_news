import 'package:hacker_client/reply/reply.dart';
import 'package:reply_repository/reply_repository.dart';

class OtherUserReplyParentModelPlaceholder extends OtherUserReplyParentModel {
  OtherUserReplyParentModelPlaceholder()
    : super(
        parent: OtherUserReplyParentPlaceholder(
          htmlText:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Praesent vel urna vitae sapien ullamcorper facilisis. '
              'Phasellus sit amet sapien non elit tincidunt euismod.',
        ),
      );
}
