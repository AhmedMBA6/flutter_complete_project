import 'package:flutter_complete_project/core/networking/api_error_handler.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/specializations_response_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);
  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _apiService.getSpecializations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
