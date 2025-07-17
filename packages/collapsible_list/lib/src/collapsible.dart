abstract class Collapsible<T> {
  const Collapsible();

  String get id;
  int get indent;
  bool get isExpanded;
  bool get isParentExpanded;

  T copyWith({
    bool? isExpanded,
    bool? isParentExpanded,
  });
}
