import 'package:equatable/equatable.dart';

class Hnuser extends Equatable {
  const Hnuser({
    required this.id,
    required this.isNew,
  });

  final String id;
  final bool isNew;

  static const empty = Hnuser(
    id: '',
    isNew: false,
  );

  @override
  List<Object> get props => [
    id,
    isNew,
  ];
}
