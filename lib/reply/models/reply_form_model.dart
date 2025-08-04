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
    required this.isDraft,
    this.submissionStatus = SubmissionStatus.initial,
  }) : _form = form,
       text = text ?? '';

  factory ReplyFormModel.from({
    required ReplyForm? form,
    required String? text,
  }) {
    return ReplyFormModel(
      form: form,
      isDraft: text != null && text.isNotEmpty,
      text: text,
    );
  }

  static const empty = ReplyFormModel(
    form: null,
    isDraft: false,
    text: '',
  );

  final ReplyForm? _form;
  final bool isDraft;
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
    bool? isDraft,
    String? text,
    SubmissionStatus? submissionStatus,
  }) {
    return ReplyFormModel(
      form: form ?? _form,
      isDraft: isDraft ?? this.isDraft,
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
