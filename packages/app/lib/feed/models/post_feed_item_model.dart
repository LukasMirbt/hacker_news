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

    if (_item.urlHost == null) {
      final url = _webLinks.resolve(_item.url);
      return l10n.feed_postShareText(
        title: title,
        url: url.toString(),
      );
    } else {
      final articleUrl = _item.url;
      final postUrl = _webLinks.itemUrl(id: _item.id);
      return l10n.feed_postWithArticleShareText(
        title: title,
        articleUrl: articleUrl,
        postUrl: postUrl.toString(),
      );
    }
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
