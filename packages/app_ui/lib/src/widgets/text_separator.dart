import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class MiddleDotSpan extends TextSpan {
  MiddleDotSpan({
    required AppUiLocalizations l10n,
  }) : super(
         children: [
           const WidgetSpan(
             child: SizedBox(
               width: AppSpacing.xs,
             ),
           ),
           TextSpan(
             text: l10n.middleDot,
           ),
           const WidgetSpan(
             child: SizedBox(
               width: AppSpacing.xs,
             ),
           ),
         ],
       );
}
