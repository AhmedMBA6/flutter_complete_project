import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:flutter_complete_project/core/helpers/shared_preference_helper.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/login_response.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final Dio dio;
  LoginCubit(this._loginRepo, this.dio) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    switch (response) {
      case ApiSuccess<LoginResponse>():
        final loginResponse = response.data;
        final token = loginResponse.userData?.token ?? '';
        await saveUserToken(loginResponse.userData?.token ?? '');
        DioFactory.updateAuthorizationHeader(token);
        emit(LoginState.loginSuccess(loginResponse));
        break;
      case ApiFailure(:final apiErrorModel):
        emit(LoginState.loginError(apiErrorModel));
        break;
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPreferenceHelper.setSecuredString(
      SharedPreferenceKeys.userToken,
      token,
    );
  }
}
