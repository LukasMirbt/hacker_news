import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;

class PreformattedTextWidget extends StatelessWidget {
  const PreformattedTextWidget({
    required this.element,
    super.key,
  });

  final dom.Element element;

  @override
  Widget build(BuildContext context) {
    return Text(
      element.text,
      style: const TextStyle(
        fontFamily: FontFamily.notoSansMono,
      ),
    );
  }
}
