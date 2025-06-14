import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/networking/api_error_model.dart';
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
      listenWhen:
          (previous, current) =>
              // current is LoginLoading ||
              current is LoginSuccess || current is LoginError,
      listener: (context, state) {
        switch (state) {
          case LoginLoading():
            // Show a loading indicator
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ),
                  ),
            );
            break;
          case LoginSuccess():
            // Navigate to the main app bottom nav bar
            context.pop();
            context.pushNamed(Routes.appBottomNavBar);
            break;
          case LoginError(:final apiErrorModel):
            // context.pop();
            setupErrorState(context, apiErrorModel);
            break;
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(
            apiErrorModel.errors != null || apiErrorModel.errors!.isNotEmpty
                ? apiErrorModel.message ??
                    "Unknown error occurred, Check your email & password and Try again!"
                : apiErrorModel.getAllErrorMessages(),
            style: TextStyles.font15DarkBlueMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Got it', style: TextStyles.font14BlueSemiBold),
            ),
          ],
        );
      },
    );
  }
}
