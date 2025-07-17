abstract interface class Collapsible<T> {
  String get id;
  int get indent;
  bool get isExpanded;
  bool get isParentExpanded;

  T copyWith({
    bool? isExpanded,
    bool? isParentExpanded,
  });
}
