import 'package:equatable/equatable.dart';
import 'package:reply_parser/reply_parser.dart';

class ReplyPageData extends Equatable {
  const ReplyPageData({
    required this.parentData,
    required this.formData,
  });

  static final empty = ReplyPageData(
    parentData: ReplyParentData.empty,
    formData: ReplyFormData.empty,
  );

  final ReplyParentData parentData;
  final ReplyFormData formData;

  @override
  List<Object?> get props => [
    parentData,
    formData,
  ];
}
