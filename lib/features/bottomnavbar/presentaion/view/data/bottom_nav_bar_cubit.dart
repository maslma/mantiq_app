import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/features/bottomnavbar/presentaion/view/data/bottom_nav_bar_state.dart';

import '../../../../../generated/app_assets.dart';
import '../home_view.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavInitial());

  int currentIndex = 0;

  final List<String> titles = const [
    "Home",
    "Favorite",
    "Notification",
    "Setting",
  ];

  final List<String> icons = const[
    AppAssets.home,
    AppAssets.fav,
    AppAssets.notification,
    AppAssets.setting,
  ];

  final List<Widget> pages = const [
    HomeView(),
    Center(child: Text("FAVORITE")),
    Center(child: Text("Notification")),
    Center(child: Text("Setting")),
  ];

  Widget get currentPage => pages[currentIndex];

  void changeTab(int index) {
    currentIndex = index;
    emit(BottomNavChanged(index));
  }
}
