import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_complete_project/features/sign_up/data/repos/sign_up_repo.dart';

import '../../../../core/networking/api_result.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupState() async {
    emit(SignupState.signupLoading());
    final response = await _signupRepo.signUp(
      SignupRequestBody(
        name: nameController.text,
        phone: phoneController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    switch (response) {
      case ApiSuccess(:final data):
        emit(SignupState.signupSuccess(data));
        break;
      case ApiFailure(:final apiErrorModel):
        emit(SignupState.signupError(apiErrorModel));
        break;
    }
  }
}
