part of 'feed_item_model.dart';

class JobFeedItemModel extends FeedItemModel {
  const JobFeedItemModel(
    JobFeedItem item, {
    WebLinks? webLinks,
    super.formatter,
  }) : _item = item,
       _webLinks = webLinks ?? const WebLinks();

  @override
  final FeedItem _item;

  final WebLinks _webLinks;

  @override
  String shareText(AppLocalizations l10n) {
    final title = _item.title;

    String url;

    if (_item.urlHost == null) {
      url = _webLinks.resolve(_item.url).toString();
    } else {
      url = _item.url;
    }

    return l10n.feed_jobShareText(
      title: title,
      url: url,
    );
  }

  @override
  List<Object> get props => [
    _item,
    _webLinks,
    ...super.props,
  ];
}
