import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

enum SubmissionStatus {
  initial,
  loading,
  success,
  failure;

  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

class NullCommentFormException with EquatableMixin implements Exception {
  const NullCommentFormException();

  @override
  List<Object?> get props => [];
}

class CommentFormModel extends Equatable {
  const CommentFormModel({
    required CommentForm? form,
    required String? text,
    this.submissionStatus = SubmissionStatus.initial,
  }) : _form = form,
       text = text ?? '';

  final CommentForm? _form;
  final String text;
  final SubmissionStatus submissionStatus;

  bool get isCommentingEnabled => _form != null;

  bool get isValid {
    final form = _form;
    if (form == null) return false;
    if (text.trim().isEmpty) return false;
    return true;
  }

  bool get isSubmissionLoading =>
      submissionStatus == SubmissionStatus.loading ||
      submissionStatus == SubmissionStatus.success;

  CommentForm toRepository() {
    final form = _form;
    if (form == null) throw const NullCommentFormException();
    return form.copyWith(text: text);
  }

  CommentFormModel copyWith({
    CommentForm? form,
    String? text,
    SubmissionStatus? submissionStatus,
  }) {
    return CommentFormModel(
      form: form ?? _form,
      text: text ?? this.text,
      submissionStatus: submissionStatus ?? this.submissionStatus,
    );
  }

  @override
  List<Object?> get props => [
    _form,
    text,
    submissionStatus,
  ];
}
