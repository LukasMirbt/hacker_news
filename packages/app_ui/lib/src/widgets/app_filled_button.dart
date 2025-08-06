import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  @visibleForTesting
  const AppFilledButton({
    required this.size,
    required this.isLoading,
    required this.onPressed,
    required this.child,
    super.key,
  });

  const AppFilledButton.shrink({
    required void Function()? onPressed,
    required Widget child,
    bool isLoading = false,
    Key? key,
  }) : this(
         key: key,
         onPressed: onPressed,
         isLoading: isLoading,
         size: AppButtonSize.shrink,
         child: child,
       );

  const AppFilledButton.expand({
    required void Function()? onPressed,
    required Widget child,
    bool isLoading = false,
    Key? key,
  }) : this(
         key: key,
         onPressed: onPressed,
         isLoading: isLoading,
         size: AppButtonSize.expand,
         child: child,
       );

  final AppButtonSize size;
  final bool isLoading;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final onPressed = this.onPressed;
    final style = FilledButtonTheme.of(context).style;
    final foregroundColor = style?.foregroundColor?.resolve({});
    final isDisabled = onPressed == null;

    return FilledButton(
      onPressed: isDisabled
          ? null
          : () {
              if (isLoading) return;
              onPressed();
            },
      style: style?.copyWith(
        minimumSize: WidgetStatePropertyAll(size.value),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          InvisiblePlaceholder(
            visible: !isLoading,
            child: child,
          ),
          if (isLoading) ButtonSpinner(foregroundColor),
        ],
      ),
    );
  }
}
