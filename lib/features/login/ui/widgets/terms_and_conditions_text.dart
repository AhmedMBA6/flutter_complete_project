import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: 'By logging in, you agree to ',
            style: TextStyles.font13GrayRegular),
        TextSpan(
            text: 'Terms of Service', style: TextStyles.font13DarkBlueMeduium),
        TextSpan(
            text: ' and ',
            style: TextStyles.font13GrayRegular.copyWith(height: 1.5)),
        TextSpan(
            text: 'Privacy Policy', style: TextStyles.font13DarkBlueMeduium)
      ]),
    );
  }
}
