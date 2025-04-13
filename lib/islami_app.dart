import 'package:flutter/material.dart';

import 'core/routes/routes_manger.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.router,
      initialRoute: RoutesManager.onboarding,


    );
  }
}
