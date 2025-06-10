import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_project/features/home/data/logic/cubit/home_state.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        switch (state) {
          case DoctorsSuccess():
            return setupSuccess(state.doctorsList);
          case DoctorsError():
            return setupError();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupSuccess(doctorsList) {
    return DoctorsListView(doctorsList: doctorsList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
