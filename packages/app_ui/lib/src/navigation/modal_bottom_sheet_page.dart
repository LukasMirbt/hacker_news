import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    required this.builder,
    this.isScrollControlled = false,
    this.showDragHandle,
  });

  final Widget Function(BuildContext) builder;
  final bool isScrollControlled;
  final bool? showDragHandle;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      settings: this,
      builder: builder,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
    );
  }
}
