// import 'package:ecommerce/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';

// class AppBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const AppBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: currentIndex,
//       selectedItemColor: AppColors.primaryColor,
//       unselectedItemColor: AppColors.grayColor,
//       onTap: onTap,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home, size: 35),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_cart_outlined, size: 35),
//           label: "Shop",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.shopping_bag_outlined, size: 35),
//           label: "Bag",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.favorite_border, size: 35),
//           label: "Favorites",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person_outline, size: 35),
//           label: "Profile",
//         ),
//       ],
//     );
//   }
// }
