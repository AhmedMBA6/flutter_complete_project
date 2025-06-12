import 'package:flutter_complete_project/core/networking/api_error_model.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  // States for specializations
  const factory HomeState.initial() = _Initial;
  const factory HomeState.sppecializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(
    List<SpecializationsData?>? specializationDataList,
  ) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ApiErrorModel apiErrorModel) =
      SpecializationsError;

  // States for doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;
  const factory HomeState.doctorsError() = DoctorsError;
}
