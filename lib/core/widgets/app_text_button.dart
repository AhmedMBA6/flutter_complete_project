import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final TextStyle textStyle;
  final String buttonText;
  final VoidCallback onPressed;
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.horizontalPadding,
      this.verticalPadding,
      this.buttonWidth,
      this.buttonHeight,
      this.backgroundColor,
      required this.textStyle,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
              ),
            ),
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                horizontal: horizontalPadding?.w ?? 12.w,
                vertical: verticalPadding?.h ?? 14.h)),
            backgroundColor: WidgetStatePropertyAll(
                backgroundColor ?? ColorsManager.primaryColor),
            fixedSize: WidgetStateProperty.all(
              Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
            )),
        child: Text(
          buttonText,
          style: textStyle,
        ));
  }
}
