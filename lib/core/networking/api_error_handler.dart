import 'package:flutter_complete_project/core/networking/api_constants.dart';

enum DataSource {
  noContent,
  badREQUEST,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defult,
}

class ResponseCode {
  static const int noContent = 204;
  static const int badREQUEST = 400;
  static const int forbidden = 403;
  static const int unAuthorized = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;
}

class ApiInternalStatus {
  static const int success = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
}

class ResponseMessage {
  static const String noContent = ApiErrors.noContent;
  static const String badREQUEST = ApiErrors.badRequestError;
  static const String forbidden = ApiErrors.forbidden;
  static const String unAuthorized = ApiErrors.unauthorizedError;
  static const String notFound = ApiErrors.notFoundError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String cacheError = ApiErrors.cacheError;
  static const String networkError = ApiErrors.networkError;
  static const String timeoutError = ApiErrors.timeoutError;
  static const String unknownError = ApiErrors.unknownError;
  static const String invalidToken = ApiErrors.invalidToken;
  static const String defult = ApiErrors.defultError;
}

extension DataSourceExtension on DataSource {
  String get message {
    switch (this) {
      case DataSource.noContent:
        return ResponseMessage.noContent;
      case DataSource.badREQUEST:
        return ResponseMessage.badREQUEST;
      case DataSource.forbidden:
        return ResponseMessage.forbidden;
      case DataSource.unAuthorized:
        return ResponseMessage.unAuthorized;
      case DataSource.notFound:
        return ResponseMessage.notFound;
      case DataSource.internalServerError:
        return ResponseMessage.internalServerError;
      case DataSource.cacheError:
        return ResponseMessage.cacheError;
      case DataSource.connectTimeout:
        return ResponseMessage.timeoutError;
      case DataSource.cancel:
        return ResponseMessage.defult;
      case DataSource.receiveTimeout:
        return ResponseMessage.timeoutError;
      case DataSource.sendTimeout:
        return ResponseMessage.timeoutError;
      case DataSource.noInternetConnection:
        return ResponseMessage.networkError;
      default:
        return ResponseMessage.defult;
    }
  }
}