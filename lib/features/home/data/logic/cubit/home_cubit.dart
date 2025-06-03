import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/data/repos/home_repo.dart';

import '../../../../../core/networking/api_result.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  void getSpecializations() async {
    emit(HomeState.sppecializationsLoading());
    final response = await _homeRepo.getSpecializations();
    switch (response) {
      case ApiSuccess(:final data):
        emit(HomeState.specializationsSuccess(data));
      case ApiFailure(:final error):
        emit(HomeState.specializationsError(error.toString()));
    }
  }
}
