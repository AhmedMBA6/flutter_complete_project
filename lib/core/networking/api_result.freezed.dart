// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResult<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ApiResult<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ApiResult<$T>()';
  }
}

/// @nodoc
class $ApiResultCopyWith<T, $Res> {
  $ApiResultCopyWith(ApiResult<T> _, $Res Function(ApiResult<T>) __);
}

/// @nodoc

class ApiSuccess<T> implements ApiResult<T> {
  const ApiSuccess(this.data);

  final T data;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiSuccessCopyWith<T, ApiSuccess<T>> get copyWith =>
      _$ApiSuccessCopyWithImpl<T, ApiSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ApiResult<$T>.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ApiSuccessCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiSuccessCopyWith(
          ApiSuccess<T> value, $Res Function(ApiSuccess<T>) _then) =
      _$ApiSuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$ApiSuccessCopyWithImpl<T, $Res>
    implements $ApiSuccessCopyWith<T, $Res> {
  _$ApiSuccessCopyWithImpl(this._self, this._then);

  final ApiSuccess<T> _self;
  final $Res Function(ApiSuccess<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(ApiSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class ApiFailure<T> implements ApiResult<T> {
  const ApiFailure(this.error);

  final String error;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ApiFailureCopyWith<T, ApiFailure<T>> get copyWith =>
      _$ApiFailureCopyWithImpl<T, ApiFailure<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ApiFailure<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'ApiResult<$T>.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ApiFailureCopyWith<T, $Res>
    implements $ApiResultCopyWith<T, $Res> {
  factory $ApiFailureCopyWith(
          ApiFailure<T> value, $Res Function(ApiFailure<T>) _then) =
      _$ApiFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$ApiFailureCopyWithImpl<T, $Res>
    implements $ApiFailureCopyWith<T, $Res> {
  _$ApiFailureCopyWithImpl(this._self, this._then);

  final ApiFailure<T> _self;
  final $Res Function(ApiFailure<T>) _then;

  /// Create a copy of ApiResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(ApiFailure<T>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
