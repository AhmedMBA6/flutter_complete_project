// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/features/home/data/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/home_screen.dart';

import '../theming/app_colors.dart';
import 'bottom_nav_bar_icon.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Home Screen with its BlocProvider and HomeRepo Provider
    BlocProvider(
      create: (context) => HomeCubit(getIt())..getSpecializations(),
      child: HomeScreen(),
    ),
    // Placeholder for Chat Screen (add its BlocProvider here when ready)
    const Center(child: Text('Chat Screen Placeholder')),
    // Placeholder for Appointments Screen (add its BlocProvider here when ready)
    const Center(child: Text('Calendar Screen Placeholder')),
    // Placeholder for Profile Screen (add its BlocProvider here when ready)
    const Center(child: Text('Profile Screen Placeholder')),
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    // Handle FAB action here
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('FAB Pressed!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SizedBox(
        width: 375.w,
        height: 80.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Bottom navigation bar background and icons
            Positioned.fill(
              top: -10,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    BottomNavBarIcon(
                      iconPath: 'assets/svgs/home_nav_bar_icon.svg',
                      isSelected: _selectedIndex == 0,
                      onPressed: () => _onNavBarTap(0),
                    ),
                    BottomNavBarIcon(
                      iconPath: 'assets/svgs/chat_nav_bar_icon.svg',
                      isSelected: _selectedIndex == 1,
                      onPressed: () => _onNavBarTap(1),
                    ),
                    SizedBox(width: 48.w), // Space for FAB
                    BottomNavBarIcon(
                      iconPath: 'assets/svgs/calendar_nav_bar_icon.svg',
                      isSelected: _selectedIndex == 2,
                      onPressed: () => _onNavBarTap(2),
                    ),
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: BottomNavBarIcon(
                        iconPath: 'assets/svgs/profile_nav_bar_icon.svg',
                        isSelected: _selectedIndex == 3,
                        onPressed: () => _onNavBarTap(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _FabButton(
              onPressed: _onFabPressed,
            ), // Extracted FAB into a new widget
          ],
        ),
      ),
    );
  }
}

// New extracted widget for the Floating Action Button
class _FabButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _FabButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -37,
      child: Center(
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.circular(27.92),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/search_nav_bar_icon.svg',
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
