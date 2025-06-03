import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';


class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("Doctor Speciality", style: TextStyles.font18DarkGreySemiBold,),
      Spacer(),
      Text("See All", style: TextStyles.font12BlueRegular,),
    ],);
  }
}