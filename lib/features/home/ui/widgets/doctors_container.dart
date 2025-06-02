import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 155.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home_blue_pattern.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpacing(16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0),
                      ),
                    ),
                    child: Text(
                      "Find Nearby",
                      style: TextStyles.font12BlueRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -60.w,
            top: 0,
            child: Image.asset(
              "assets/images/doctor_image_home_blue_container.png",
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
