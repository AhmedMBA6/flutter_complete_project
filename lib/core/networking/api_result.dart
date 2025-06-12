import 'package:flutter_complete_project/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  // const factory ApiResult.success(T data) = Success<T>;
  // const factory ApiResult.failure(String error) = Failure<T>;
  const factory ApiResult.success(T data) = ApiSuccess<T>;
  const factory ApiResult.failure(ApiErrorModel apiErrorModel) = ApiFailure<T>;
}
