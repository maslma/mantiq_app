import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/core/components/widgets/main_button.dart';
import 'package:mantiq_app/core/components/widgets/text_gradiate_widget.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/routes/routes.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_cubit.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_state.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_static.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/widget/custom_slider.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/widget/dot_controller.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextGradiateWidget(
                      fontSize: 28,
                      text: 'Mantiq',
                      fontWeight: FontWeight.w700,
                    ).onlyPadding(topPadding: 24, leftPadding: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: Text(
                        "skip",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor2,
                        ),
                        textAlign: TextAlign.center,
                      ).onlyPadding(topPadding: 31.5, rightPadding: 16),
                    ),
                  ],
                ),
                const Expanded(flex: 3, child: CustomSliderOnBoarding()),
                Expanded(
                  child: Column(
                    children: [
                      MainButton(
                        title: cubit.currentPage == onBoardingList.length - 1
                            ? "Get Started"
                            : "Next",
                        onTap: () {
                          if (cubit.currentPage == onBoardingList.length - 1) {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.login,
                            );
                          }else{
                            cubit.next(context);
                          }
                        },
                      ).horizontalPadding(16),
                      25.verticalSizedBox,
                      const CustomDotControllerOnBoarding().verticalPadding(15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
