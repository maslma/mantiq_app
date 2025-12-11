// import 'package:ecommerce/features/bottomnavbar/presentaion/view/data/bottom_nav_bar_cubit.dart';
// import 'package:ecommerce/features/bottomnavbar/presentaion/view/data/bottom_nav_bar_state.dart';
// import 'package:ecommerce/features/bottomnavbar/presentaion/view/widget/bottom_navigation_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BottomNavView extends StatelessWidget {
//   const BottomNavView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
//       builder: (context, state) {
//         final cubit = context.read<BottomNavBarCubit>();
//         return Scaffold(
//           body: cubit.currentPage,
//           bottomNavigationBar: AppBottomNavBar(
//             currentIndex: cubit.currentIndex,
//             onTap: cubit.changeTab,
//           ),
//         );
//       },
//     );
//   }
// }
