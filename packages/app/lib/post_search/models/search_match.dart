import 'package:equatable/equatable.dart';

class SearchMatch extends Equatable {
  const SearchMatch({
    required this.start,
    required this.end,
    required this.isStartOfText,
    required this.isEndOfText,
  });

  final int start;
  final int end;
  final bool isStartOfText;
  final bool isEndOfText;

  int get length => end - start;

  bool contains(int index) => index >= start && index < end;

  @override
  List<Object> get props => [
    start,
    end,
    isStartOfText,
    isEndOfText,
  ];
}
