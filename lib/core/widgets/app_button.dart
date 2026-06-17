import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Widget? icon;
  final BorderSide? border;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    if (isPrimary) {
      return SizedBox(
        width: context.width,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon ?? const SizedBox.shrink(),
          label: Text(text),
          style: ElevatedButton.styleFrom(side: border),
        ),
      );
    } else {
      return SizedBox(
        width: context.width,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: icon ?? const SizedBox.shrink(),
          label: Text(text),
          style: OutlinedButton.styleFrom(side: border),
        ),
      );
    }
  }
}
