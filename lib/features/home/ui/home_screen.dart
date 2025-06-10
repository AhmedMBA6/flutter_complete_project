import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';

import '../../../core/helpers/spacing.dart';
import 'widgets/doctors_list/doctors_bloc_builder.dart';
import 'widgets/doctors_container.dart';
import 'widgets/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
              DoctorsContainer(),
              verticalSpacing(24),
              DoctorsSpecialitySeeAll(),
              verticalSpacing(16),
              SpecializationsBlocBuilder(),
              verticalSpacing(8),
              DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
