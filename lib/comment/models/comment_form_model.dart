import 'package:post_repository/post_repository.dart';

enum SubmissionStatus {
  initial,
  loading,
  success,
  failure;

  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

class CommentFormModel {
  const CommentFormModel({
    required CommentForm? form,
    this.submissionStatus = SubmissionStatus.initial,
  }) : _form = form;

  final SubmissionStatus submissionStatus;
  final CommentForm? _form;

  static const empty = CommentFormModel(
    form: null,
  );

  String get text => _form?.text ?? '';

  bool get isCommentingEnabled => _form != null;

  bool get isValid {
    final form = _form;
    if (form == null) return false;

    final text = form.text;
    if (text.trim().isEmpty) return false;

    return true;
  }

  bool get isSubmissionLoading =>
      submissionStatus == SubmissionStatus.loading ||
      submissionStatus == SubmissionStatus.success;

  CommentForm? toRepository() => _form;

  CommentFormModel updateWith({
    required CommentForm? form,
  }) {
    return CommentFormModel(
      submissionStatus: submissionStatus,
      form: form?.copyWith(
        text: _form?.text ?? '',
      ),
    );
  }

  CommentFormModel copyWith({
    String? text,
    SubmissionStatus? submissionStatus,
  }) {
    return CommentFormModel(
      submissionStatus: submissionStatus ?? this.submissionStatus,
      form: _form?.copyWith(
        text: text ?? _form.text,
      ),
    );
  }
}
