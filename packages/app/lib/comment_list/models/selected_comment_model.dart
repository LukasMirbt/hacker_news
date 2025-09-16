import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class SelectedCommentModel {
  const SelectedCommentModel({
    required this.id,
    required this.index,
    ScrollAnimator? animator,
  }) : _animator = animator ?? const ScrollAnimator();

  final String id;
  final int index;
  final ScrollAnimator _animator;

  double get alignment => 0;

  Curve curve(_) => Curves.easeInOut;

  Duration duration(double estimatedDistance) {
    return _animator.duration(estimatedDistance);
  }
}
