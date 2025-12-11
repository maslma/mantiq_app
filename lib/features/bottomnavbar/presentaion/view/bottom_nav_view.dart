import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/features/bottomnavbar/presentaion/view/widget/bottom_navigation_widget.dart';

import 'data/bottom_nav_bar_cubit.dart';
import 'data/bottom_nav_bar_state.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          final cubit = context.read<BottomNavBarCubit>();
          return Scaffold(
            body: cubit.currentPage,
            backgroundColor: Colors.white,
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: cubit.currentIndex,
              icons: cubit.icons,
              titles: cubit.titles,
              onTap: cubit.changeTab,
            ),
          );
        },
      ),
    );
  }
}