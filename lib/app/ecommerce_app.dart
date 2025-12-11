import 'package:flutter/material.dart';
import '../core/routes/app_router.dart';

class MantiqApp extends StatelessWidget {
  const MantiqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantiq App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: "Metropolis",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
