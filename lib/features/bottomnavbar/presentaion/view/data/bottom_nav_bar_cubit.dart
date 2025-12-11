// import 'package:ecommerce/features/bottomnavbar/presentaion/view/data/bottom_nav_bar_state.dart';
// import 'package:ecommerce/features/home/presentaion/view/home_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BottomNavBarCubit extends Cubit<BottomNavBarState> {
//   BottomNavBarCubit() : super(BottomNavInitial());

//   int currentIndex = 0;

//   final List<Widget> pages = const [
//     HomeView(),
//     Center(child: Text("Shop")),
//     Center(child: Text("Bag")),
//     Center(child: Text("Favorites")),
//     Center(child: Text("Profile")),
//   ];

//   Widget get currentPage => pages[currentIndex];

//   void changeTab(int index) {
//     currentIndex = index;
//     emit(BottomNavChanged(index));
//   }
// }
