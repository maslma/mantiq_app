import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<String> titles;
  final List<String> icons;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.titles,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.grayColor,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icons[0],
          ),
          label: titles[0],
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icons[1],
          ),
          label: titles[1],
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icons[2],
          ),
          label: titles[2],
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icons[3],
          ),
          label: titles[3],
        ),
      ],
    );
  }
}
