import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AppWidgetFactory extends WidgetFactory {
  @override
  Iterable<dynamic> getDependencies(BuildContext context) {
    return [
      ...super.getDependencies(context),
      ColorScheme.of(context),
    ];
  }

  @override
  void parse(BuildTree tree) {
    super.parse(tree);

    if (tree.element.localName == 'a') {
      tree.register(_anchorBuildOp());
    }
  }

  BuildOp _anchorBuildOp() {
    return BuildOp(
      onParsed: (tree) {
        return tree..inherit(
          (p, _) {
            final colorScheme = p.get<ColorScheme>();
            if (colorScheme == null) return p;

            final newStyle = p.prepareTextStyle().copyWith(
              color: colorScheme.onSurface,
            );

            return p.copyWith<TextStyle>(style: newStyle);
          },
        );
      },
    );
  }

  @override
  Widget? buildGestureDetector(
    BuildTree tree,
    Widget child,
    GestureRecognizer recognizer,
  ) {
    final builtChild = super.buildGestureDetector(tree, child, recognizer);

    if (tree.element.localName == 'a' && builtChild != null) {
      return Semantics(
        button: true,
        link: true,
        label: tree.element.text,
        child: builtChild,
      );
    }

    return builtChild;
  }
}
