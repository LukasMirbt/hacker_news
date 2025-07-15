import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TextSeparator extends StatelessWidget {
  const TextSeparator({
    this.style,
    super.key,
  });

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l10n = AppUiLocalizations.of(context);

    return Skeleton.ignore(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxs,
        ),
        child: Text(
          l10n.separator,
          style: style,
        ),
      ),
    );
  }
}
