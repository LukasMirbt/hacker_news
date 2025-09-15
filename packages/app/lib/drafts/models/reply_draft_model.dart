part of 'draft_model.dart';

class ReplyDraftModel extends DraftModel {
  const ReplyDraftModel({
    required ReplyDraft draft,
    TextParser? textParser,
  }) : _draft = draft,
       _textParser = textParser ?? const TextParser();

  final ReplyDraft _draft;
  final TextParser _textParser;

  String get url => _draft.url;
  String get title => _draft.content;

  String get subtitle {
    final htmlText = _draft.parentHtmlText;
    return _textParser.parse(htmlText);
  }

  ReplyDraft toRepository() => _draft;

  @override
  List<Object> get props => [_draft];
}
