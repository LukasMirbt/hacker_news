import 'package:post_repository/post_repository.dart';

enum CommentStatus {
  initial,
  loading,
  success,
  failure;

  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

class CommentFormModel {
  const CommentFormModel({
    required this.fetchStatus,
    required CommentForm? form,
    this.submissionStatus = CommentStatus.initial,
  }) : _form = form;

  final FetchStatus fetchStatus;
  final CommentStatus submissionStatus;
  final CommentForm? _form;

  static const empty = CommentFormModel(
    fetchStatus: FetchStatus.loading,
    form: null,
  );

  String get text => _form?.text ?? '';

  bool get isCommentingEnabled => _form != null && fetchStatus.isSuccess;

  bool get isValid {
    final form = _form;
    if (form == null) return false;

    final text = form.text;
    if (text.trim().isEmpty) return false;

    return true;
  }

  bool get isSubmissionLoading =>
      submissionStatus == CommentStatus.loading ||
      submissionStatus == CommentStatus.success;

  CommentForm? toRepository() => _form;

  CommentFormModel updateWith({
    required FetchStatus fetchStatus,
    required CommentForm? form,
  }) {
    return CommentFormModel(
      fetchStatus: fetchStatus,
      submissionStatus: submissionStatus,
      form: form?.copyWith(
        text: _form?.text ?? '',
      ),
    );
  }

  CommentFormModel copyWith({
    required String text,
  }) {
    return CommentFormModel(
      fetchStatus: fetchStatus,
      submissionStatus: submissionStatus,
      form: _form?.copyWith(text: text),
    );
  }
}
