import 'package:equatable/equatable.dart';
import 'package:post_parser/post_parser.dart';

class PostData extends Equatable {
  const PostData({
    required this.fatItemData,
    required this.comments,
  });

  static final empty = PostData(
    fatItemData: DetailFatItemData.empty,
    comments: const [],
  );

  final DetailFatItemData fatItemData;
  final List<CommentData> comments;

  @override
  List<Object> get props => [
    fatItemData,
    comments,
  ];
}
