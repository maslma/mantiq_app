import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/data/onboarding_cubit.dart';
import 'package:mantiq_app/features/onboarding/presentaion/view/onboarding_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [BlocProvider(create: (_) => OnBoardingCubit())],
            child: const OnBoardingView(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      // case Routes.signup:
      //   return MaterialPageRoute(builder: (context) => const SignUpView());
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgotPasswordView(),
      //   );
      // case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (context) => MultiBlocProvider(
      //       providers: [BlocProvider(create: (_) => BottomNavBarCubit())],
      //       child: const BottomNavView(),
      //     ),
      //   );
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
