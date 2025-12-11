import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mantiq_app/features/detail_session/presentaion/view/data/detail_session_cubit.dart';
import 'package:mantiq_app/features/payment/presentaion/view/data/payment_cubit.dart';
import 'package:mantiq_app/features/payment/presentaion/view/payment_view.dart';

import '../../features/bottomnavbar/presentaion/view/bottom_nav_view.dart';
import '../../features/bottomnavbar/presentaion/view/data/bottom_nav_bar_cubit.dart';
import '../../features/detail_session/presentaion/view/detail_session_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      // case Routes.login:
      //   return MaterialPageRoute(builder: (context) => const LoginView());
      // case Routes.signup:
      //   return MaterialPageRoute(builder: (context) => const SignUpView());
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgotPasswordView(),
      //   );
      case Routes.bottomNav:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [BlocProvider(create: (_) => BottomNavBarCubit())],
            child: const BottomNavView(),
          ),
        );
      case Routes.detailSession:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [BlocProvider(create: (_) => DetailSessionCubit())],
            child: const DetailSessionView(),
          ),
        );
      case Routes.payment:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [BlocProvider(create: (_) => PaymentCubit())],
            child: const PaymentView(totalAmount: '10'),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => const BottomNavView());
    }
  }
}
