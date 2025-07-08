import 'package:flutter/material.dart';

class ButtonSpinner extends StatelessWidget {
  const ButtonSpinner(
    this.color, {
    super.key,
  });

  final Color? color;

  static const double _size = 16;
  static const double _strokeWidth = 2.5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: CircularProgressIndicator(
        strokeWidth: _strokeWidth,
        color: color,
      ),
    );
  }
}
