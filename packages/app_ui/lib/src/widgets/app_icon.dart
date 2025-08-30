import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    this.size,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    super.key,
  }) : filled = false;

  const AppIcon.filled(
    this.icon, {
    this.size,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    super.key,
  }) : filled = true;

  final bool filled;
  final IconData icon;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final opticalSize = this.opticalSize ?? size;
    var grade = this.grade;

    final brightness = Theme.brightnessOf(context);

    if (grade != null && brightness == Brightness.dark) {
      grade = grade - 25;
    }

    final fill = filled ? 1.0 : 0.0;

    return Icon(
      icon,
      size: size,
      fill: fill,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      color: color,
    );
  }
}
