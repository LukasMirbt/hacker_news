import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

export 'app_widget_factory.dart';
export 'preformatted_text_widget.dart';

class AppHtmlWidget extends StatelessWidget {
  const AppHtmlWidget({
    required this.html,
    required this.onLinkPressed,
    super.key,
  });

  final String html;
  final void Function(String) onLinkPressed;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: HtmlWidget(
        html,
        factoryBuilder: AppWidgetFactory.new,
        onTapUrl: (url) {
          onLinkPressed(url);
          return true;
        },
        customWidgetBuilder: (element) {
          final localName = element.localName;
          if (localName == 'pre') {
            return PreformattedTextWidget(element: element);
          }
          return null;
        },
      ),
    );
  }
}
