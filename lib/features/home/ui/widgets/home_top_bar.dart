import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/app_colors.dart';
import 'package:flutter_complete_project/core/theming/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Ahmed!", style: TextStyles.font18DarkBlueBold),
            Text("How Are you Today?", style: TextStyles.font12GrayRegular),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: ColorsManager.moreLighterGrey,
          child: SvgPicture.asset("assets/svgs/notification.svg"),
        ),
      ],
    );
  }
}
