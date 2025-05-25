import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/app_colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;

  const PasswordValidations(
      {super.key,
      required this.hasUpperCase,
      required this.hasLowerCase,
      required this.hasNumber,
      required this.hasSpecialCharacter,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          'At least one uppercase letter',
          hasUpperCase,
        ),
        verticalSpacing(2),
        buildValidationRow(
          'At least one lowercase letter',
          hasLowerCase,
        ),
        verticalSpacing(2),
        buildValidationRow(
          'At least one number',
          hasNumber,
        ),
        verticalSpacing(2),
        buildValidationRow(
          'At least one special character',
          hasSpecialCharacter,
        ),
        verticalSpacing(2),
        buildValidationRow(
          'At least 8 characters long',
          hasMinLength,
        ),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.grey,
        ),
        horizontalSpacing(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: Colors.green,
              decorationThickness: 2.0,
              color: hasValidated ? Colors.grey : ColorsManager.darkBlue),
        ),
      ],
    );
  }
}
