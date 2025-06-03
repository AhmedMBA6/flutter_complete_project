import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 0.0 : 24.0.w,
            ),
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
                Text(
                  'General ${index + 1}',
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
