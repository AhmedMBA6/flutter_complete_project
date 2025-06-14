import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/app_colors.dart';

class BottomNavBarIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final VoidCallback onPressed;

  const BottomNavBarIcon({
    super.key,
    required this.iconPath,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? ColorsManager.primaryColor : ColorsManager.darkBlue,
          BlendMode.srcIn,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
