import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final SpecializationsData? specializationsData;
  const DoctorsSpecialityListViewItem({
    super.key,
    required this.itemIndex,
    this.specializationsData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0.0 : 24.0.w),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.0,
            backgroundColor: ColorsManager.lightBlue,
            child: Image.asset(
              'assets/images/general_speciality.png',
              width: 40.0.w,
              height: 40.0.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpacing(8.0.h),
          Text(specializationsData?.name ?? 'Speciality', style: TextStyles.font12DarkBlueRegular),
        ],
      ),
    );
  }
}
