import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/routes.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_complete_project/features/login/logic/cubit/login_cubit.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        switch (state) {
          case Loading():
            // Show a loading indicator
            showDialog(
                context: context,
                builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    )));
            break;
          case Success():
            // Navigate to the home screen
            context.pop();
            context.pushNamed(Routes.homeScreen);
            break;
          case Error(:final error):
            // Show an error message
            setupErrorState(context, error);
            break;
        }
      },
      child: SizedBox.shrink(),
    );
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
}
