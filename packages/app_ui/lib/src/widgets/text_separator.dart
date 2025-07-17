import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class MiddleDotSpan extends TextSpan {
  MiddleDotSpan({
    required AppUiLocalizations l10n,
    TextStyle? style,
  }) : super(
         children: [
           const WidgetSpan(
             child: SizedBox(
               width: AppSpacing.xxs,
             ),
           ),
           TextSpan(
             text: l10n.separator,
             style: style,
           ),
           const WidgetSpan(
             child: SizedBox(
               width: AppSpacing.xxs,
             ),
           ),
         ],
       );
}
