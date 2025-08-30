part of 'feed_item_model.dart';

class PostFeedItemModel extends FeedItemModel {
  const PostFeedItemModel(
    PostFeedItem item, {
    WebLinks? webLinks,
    super.formatter,
  }) : _item = item,
       _webLinks = webLinks ?? const WebLinks();

  @override
  final PostFeedItem _item;

  final WebLinks _webLinks;

  String get user => _item.hnuser.id;
  String get score => _item.score.toString();
  String get commentCount => _item.commentCount.toString();
  String? get upvoteUrl => _item.upvoteUrl;
  bool get hasBeenUpvoted => _item.hasBeenUpvoted;

  @override
  String shareText(AppLocalizations l10n) {
    final title = _item.title;
    final postUrl = _webLinks.postUrl(id);

    if (_item.urlHost == null) {
      return l10n.feed_postShareText(
        title: title,
        postUrl: postUrl.toString(),
      );
    }

    final articleUrl = _webLinks.resolve(_item.url);

    return l10n.feed_articleAndDiscussionShareText(
      title: title,
      articleUrl: articleUrl.toString(),
      discussionUrl: postUrl.toString(),
    );
  }

  PostFeedItemModel vote(VoteType type) {
    return PostFeedItemModel(
      switch (type) {
        VoteType.upvote => _item.upvote(),
        VoteType.unvote => _item.unvote(),
      },
    );
  }

  @override
  List<Object> get props => [
    _item,
    _formatter,
    _webLinks,
  ];
}
