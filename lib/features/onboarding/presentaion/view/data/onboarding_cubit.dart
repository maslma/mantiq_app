import 'package:flutter/material.dart';
import 'package:mantiq_app/core/local/chach_helper.dart';
import 'package:mantiq_app/core/routes/routes.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_static.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  int currentPage = 0;

  void next(context) {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      ChachHelper.sharedPreferences.setString("step", "1");
      Navigator.pushReplacementNamed(context, Routes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingNextState());
    }
  }

  void onPageChange(int index) {
    currentPage = index;
    emit(OnBoardingCurrentPageState());
  }
}
