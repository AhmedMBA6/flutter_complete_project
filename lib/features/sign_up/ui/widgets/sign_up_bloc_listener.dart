import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/app_colors.dart';
import 'package:flutter_complete_project/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_complete_project/features/sign_up/logic/cubit/sign_up_state.dart';

import '../../../../core/theming/styles.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignupState>(
        listenWhen: (previous, current) =>
            current is SignupLoading ||
            current is SignupSuccess ||
            current is SignupError,
        child: SizedBox.shrink(),
        listener: (context, state) {
          switch (state) {
            case SignupLoading():
              // Show a loading indicator
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  ),
                ),
              );
              break;
            case SignupSuccess():
              // Navigate to the home screen
              context.pop(); // Close the loading dialog
              showSuccessDialog(context);
              // Replace with your home route
              break;
            case SignupError(:final error):
              // Show an error message
              context.pop(); // Close the loading dialog
              setupErrorState(context, error);
              break;
          }
        });
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop(); // Close the loading dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text(
            error,
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                'Got it',
                style: TextStyles.font14BlueSemiBold,
              ),
            ),
          ],
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 32,
          ),
          title: Text('Signup successful!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have successfully signed up!')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.primaryColor,
              ),
              child: Text(
                'Continue',
                style: TextStyles.font14BlueSemiBold,
              ),
            ),
          ],
        );
      },
    );
  }
}
