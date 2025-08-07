import 'package:draft_repository/draft_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:web_links/web_links.dart';

class DraftModel extends Equatable {
  const DraftModel(
    Draft draft, {
    WebLinks? webLinks,
  }) : _draft = draft,
       _links = webLinks ?? const WebLinks();

  final Draft _draft;
  final WebLinks _links;

  /*   String get id => _draft.id; */

  String? get postId => switch (_draft) {
    CommentDraft() => _draft.postId,
    ReplyDraft() => null,
  };

  String? get onTitle => switch (_draft) {
    CommentDraft() => _draft.postTitle,
    ReplyDraft() => null,
  };

  Draft toRepository() => _draft;

  @override
  List<Object> get props => [
    _draft,
    _links,
  ];
}
