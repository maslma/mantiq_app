import 'package:flutter/material.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';
import 'package:mantiq_app/core/routes/routes.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';
import 'package:mantiq_app/core/theme/app_text_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => context.pushNamed(Routes.onBoarding));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          "Mantiq",
          style: AppTextStyles.font36BoldkWeight700.copyWith(
            
          ),
        ).center(),
      ),
    );
  }
}
