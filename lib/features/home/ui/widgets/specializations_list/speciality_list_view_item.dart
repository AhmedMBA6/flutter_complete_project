import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final SpecializationsData? specializationsData;
  const SpecialityListViewItem({
    super.key,
    required this.itemIndex,
    this.specializationsData,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0.0 : 24.0.w),
      child: Column(
        children: [
          itemIndex == selectedIndex
              ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.darkBlue),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    'assets/images/general_speciality.png',
                    width: 42.w,
                    height: 42.h,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : CircleAvatar(
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
          Text(
            specializationsData?.name ?? 'Speciality',
            style:
                itemIndex == selectedIndex
                    ? TextStyles.font14DarkBlueBold
                    : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
