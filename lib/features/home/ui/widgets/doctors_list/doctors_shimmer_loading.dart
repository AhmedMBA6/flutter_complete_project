import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsShimmerLoading extends StatelessWidget {
  const DoctorsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: ColorsManager.lightGrey,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                horizontalSpacing(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 180.w,
                          height: 18.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      verticalSpacing(12),
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 160.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGrey,
                            borderRadius: BorderRadius.circular(12),
                          )
                        ),
                      ),
                      verticalSpacing(12),
                      Shimmer.fromColors(
                        baseColor: ColorsManager.lightGrey,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 160.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: ColorsManager.lightGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
