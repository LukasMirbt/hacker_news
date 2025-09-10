part of 'draft_model.dart';

class ReplyDraftModel extends DraftModel {
  const ReplyDraftModel({
    required ReplyDraft draft,
  }) : _draft = draft;

  final ReplyDraft _draft;

  String get url => _draft.url;
  String get title => _draft.content;

  // TODO: Refactor to use TextParser
  String get subtitle {
    final document = parse(_draft.parentHtmlText);
    final buffer = StringBuffer();

    final textNodes = document.body?.nodes;

    if (textNodes != null) {
      for (final node in textNodes) {
        if (buffer.isNotEmpty) {
          buffer.write(' ');
        }
        buffer.write(node.text?.trim());
      }
    }

    return buffer.toString().trim();
  }

  ReplyDraft toRepository() => _draft;

  @override
  List<Object> get props => [_draft];
}
