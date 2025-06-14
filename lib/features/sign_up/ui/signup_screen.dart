import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter_complete_project/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';
import '../logic/cubit/sign_up_cubit.dart';
import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: TextStyles.font24BlueBold),
                verticalSpacing(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(36),
                Column(
                  children: [
                    SignupForm(),
                    verticalSpacing(40),
                    AppTextButton(
                        textStyle: TextStyles.font16WhiteSemiBold,
                        buttonText: "Create Account",
                        onPressed: () {
                          validateThenSignup(context);
                        }),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(60),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignupState();
    }
  }
}
