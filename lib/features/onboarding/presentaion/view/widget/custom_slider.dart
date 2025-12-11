import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/theme/app_text_styles.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_cubit.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_state.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_static.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return PageView.builder(
          controller: cubit.pageController,
          onPageChanged: (val) {
            cubit.onPageChange(val);
          },
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) => Column(
            children: [
              32.verticalSizedBox,
              Image.asset(onBoardingList[index].image!),
              24.verticalSizedBox,
              Text(
                onBoardingList[index].title!,
                style: AppTextStyles.font20SemiBoldWeight600,
                textAlign: TextAlign.center,
              ),
              16.verticalSizedBox,
              Text(
                onBoardingList[index].body!,
                textAlign: TextAlign.center,
                style: AppTextStyles.font14MediumWeight500,
              ),
            ],
          ),
        );
      },
    );
  }
}
