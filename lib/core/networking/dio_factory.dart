import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/helpers/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/shared_preference_helper.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = timeout;
      dio!.options.receiveTimeout = timeout;

      addDioInterceptors();
      await addDioHeaders();
      return dio!;
    }

    return dio!;
  }

  static Future<void> addDioHeaders() async {
    final token = await SharedPreferenceHelper.getSecuredString(SharedPreferenceKeys.userToken);
    dio?.options.headers.clear();
    dio?.options.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    // dio?.options.headers.addAll({
    //   'Accept': 'application/json',
    //   'Authorization':
    //       'Bearer ${await SharedPreferenceHelper.getString(SharedPreferenceKeys.userToken)}',
    // });
  }

   static void updateAuthorizationHeader(String token) {
    dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void addDioInterceptors() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
