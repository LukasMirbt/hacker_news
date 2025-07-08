import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' as dom;

class AnchorWidget extends StatelessWidget {
  const AnchorWidget({
    required this.element,
    required this.onLinkPressed,
    super.key,
  });

  final dom.Element element;
  final void Function(String) onLinkPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return InlineCustomWidget(
      child: Semantics(
        button: true,
        child: GestureDetector(
          onTap: () {
            onLinkPressed(element.text);
          },
          child: Text.rich(
            TextSpan(text: element.text),
            style: TextStyle(
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
