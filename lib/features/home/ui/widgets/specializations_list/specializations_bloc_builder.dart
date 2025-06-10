import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';

import '../../../data/logic/cubit/home_cubit.dart';
import '../../../data/logic/cubit/home_state.dart';
import 'speciality_list_view.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
            var specializationsList = state.specializationDataList;
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
    return SpecialityListView(
      specializationDataList: specializationsList ?? [],
    );
  }
}

class SetupLoading extends StatelessWidget {
  const SetupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SpecialityShimmerLoading(),
          verticalSpacing(8),
          DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
