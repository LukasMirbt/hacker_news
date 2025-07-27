import 'package:equatable/equatable.dart';
import 'package:reply_repository/reply_repository.dart';

enum SubmissionStatus {
  initial,
  loading,
  success,
  failure;

  bool get isFailure => this == failure;
  bool get isSuccess => this == success;
}

class NullReplyFormException with EquatableMixin implements Exception {
  const NullReplyFormException();

  @override
  List<Object?> get props => [];
}

class ReplyFormModel extends Equatable {
  const ReplyFormModel({
    required ReplyForm? form,
    required String? text,
    this.submissionStatus = SubmissionStatus.initial,
  }) : _form = form,
       text = text ?? '';

  static const empty = ReplyFormModel(
    form: null,
    text: '',
  );

  final ReplyForm? _form;
  final String text;
  final SubmissionStatus submissionStatus;

  bool get isReplyingEnabled => _form != null;

  bool get isValid {
    final form = _form;
    if (form == null) return false;
    if (text.trim().isEmpty) return false;
    return true;
  }

  bool get isSubmissionLoading =>
      submissionStatus == SubmissionStatus.loading ||
      submissionStatus == SubmissionStatus.success;

  ReplyForm toRepository() {
    final form = _form;
    if (form == null) throw const NullReplyFormException();
    return form.copyWith(text: text);
  }

  ReplyFormModel copyWith({
    ReplyForm? form,
    String? text,
    SubmissionStatus? submissionStatus,
  }) {
    return ReplyFormModel(
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
