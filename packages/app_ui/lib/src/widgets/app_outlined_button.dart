import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  @visibleForTesting
  const AppOutlinedButton({
    required this.size,
    required this.isLoading,
    required this.onPressed,
    required this.child,
    super.key,
  });

  const AppOutlinedButton.shrink({
    required void Function()? onPressed,
    required Widget child,
    bool isLoading = false,
    Key? key,
  }) : this(
         size: AppButtonSize.shrink,
         isLoading: isLoading,
         onPressed: onPressed,
         child: child,
         key: key,
       );

  const AppOutlinedButton.expand({
    required void Function()? onPressed,
    required Widget child,
    bool isLoading = false,
    Key? key,
  }) : this(
         size: AppButtonSize.expand,
         isLoading: isLoading,
         onPressed: onPressed,
         child: child,
         key: key,
       );

  final AppButtonSize size;
  final bool isLoading;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final onPressed = this.onPressed;
    final style = OutlinedButtonTheme.of(context).style;
    final foregroundColor = style?.foregroundColor?.resolve({});
    final isDisabled = onPressed == null;

    return OutlinedButton(
      onPressed: isDisabled
          ? null
          : () {
              if (isLoading) return;
              onPressed();
            },
      style: style?.copyWith(
        minimumSize: WidgetStatePropertyAll(size.value),
        foregroundColor: WidgetStatePropertyAll(foregroundColor),
      ),
      child: isLoading ? ButtonSpinner(foregroundColor) : child,
    );
  }
}
