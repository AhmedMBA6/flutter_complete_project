import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout');
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request canceled');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Request time out');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive time out');
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: "Faild when trying to connect to the server",
          );
        default:
          return ApiErrorModel(message: 'Somthing went wrong');
      }
    } else {
      return ApiErrorModel(message: 'Somthing went wrong');
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  final errorsData = data['data'];
  Map<dynamic, dynamic>? errorsMap;

  if (errorsData is Map) {
    errorsMap = errorsData;
  } else if (errorsData is List) {
    // Wrap the list in a map with a generic key
    errorsMap = {'errors': errorsData};
  } else {
    errorsMap = null;
  }

  return ApiErrorModel(
    message: data['message'] ?? 'An error occurred',
    code: data['code'],
    errors: errorsMap,
  );
}
