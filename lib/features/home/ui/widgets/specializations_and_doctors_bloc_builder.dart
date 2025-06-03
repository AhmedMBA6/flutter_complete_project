import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/logic/cubit/home_cubit.dart';
import '../../data/logic/cubit/home_state.dart';
import 'doctors_list_view.dart';
import 'doctors_speciality_list_view.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              current is SpecializationsLoading ||
              current is SpecializationsSuccess ||
              current is SpecializationsError,
      builder: (context, state) {
        switch (state) {
          case SpecializationsLoading():
            return SetupLoading();
          case SpecializationsSuccess():
            var specializationsList =
                state.specializationsResponseModel.specializationDataList;
            return SetupSuccess(specializationsList: specializationsList);
          case SpecializationsError():
            return SetupError();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class SetupError extends StatelessWidget {
  const SetupError({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}

class SetupSuccess extends StatelessWidget {
  const SetupSuccess({super.key, required this.specializationsList});

  final List<SpecializationsData?>? specializationsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
      children: [
        DoctorsSpecialityListView(
          specializationDataList: specializationsList ?? [],
        ),
        verticalSpacing(10.h),
        DoctorsListView(doctorsList: specializationsList?[0]?.doctorsList),
      ],
    ),
    );
  }
}

class SetupLoading extends StatelessWidget {
  const SetupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
