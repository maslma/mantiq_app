import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_cubit.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_state.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                margin: EdgeInsets.only(right: 5),
                duration: const Duration(milliseconds: 500),
                width: cubit.currentPage == index ? 7 : 7,
                height: 6,
                decoration: BoxDecoration(
                  color: cubit.currentPage == index
                      ? AppColors.primaryColor
                      : AppColors.primaryColor4,
                  borderRadius: BorderRadius.circular(47),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
