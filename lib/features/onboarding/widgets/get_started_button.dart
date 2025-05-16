import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/theming/app_colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

import '../../../core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pushNamed(Routes.loginScreen),
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.primaryColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteIner,
      ),
    );
  }
}
