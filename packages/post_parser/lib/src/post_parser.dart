import 'package:post_parser/post_parser.dart';

class PostParser {
  const PostParser({
    HtmlParser? htmlParser,
    DetailFatItemParser? detailFatItemParser,
    CommentListParser? commentListParser,
  }) : _htmlParser = htmlParser ?? const HtmlParser(),
       _fatItemParser = detailFatItemParser ?? const DetailFatItemParser(),
       _commentListParser = commentListParser ?? const CommentListParser();

  final HtmlParser _htmlParser;
  final DetailFatItemParser _fatItemParser;
  final CommentListParser _commentListParser;

  PostData parse(String html) {
    final document = _htmlParser.parse(html);
    final fatItem = document.querySelector('.fatitem');

    var fatItemData = DetailFatItemData.empty;

    if (fatItem != null) {
      fatItemData = _fatItemParser.parse(fatItem);
    }

    final commentTreeElement = document.querySelector('.comment-tree');

    var comments = <CommentData>[];

    if (commentTreeElement != null) {
      comments = _commentListParser.parse(commentTreeElement);
    }

    return PostData(
      fatItemData: fatItemData,
      comments: comments,
    );
  }
}
