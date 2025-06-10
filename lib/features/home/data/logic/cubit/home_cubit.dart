import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';

import '../../../../../core/networking/api_result.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  List<SpecializationsData?>? specializationsList = [];

  void getSpecializations() async {
    emit(HomeState.sppecializationsLoading());
    final response = await _homeRepo.getSpecializations();
    switch (response) {
      case ApiSuccess(:final data):
        specializationsList = data.specializationDataList ?? [];
        getDoctorsList(
          specializationId: specializationsList?.first?.id,
        ); // Default to first specialization
        emit(HomeState.specializationsSuccess(specializationsList));
      case ApiFailure(:final error):
        emit(HomeState.specializationsError(error.toString()));
    }
  }

  void getDoctorsList({required int? specializationId}) async {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError("No doctors found for this specialization"));
    }
  }

  /// returns the List of doctors for the given specialization ID
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
