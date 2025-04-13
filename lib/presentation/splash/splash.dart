
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/colors_manger.dart';

import '../../core/resources/assets_manger.dart';
import '../../core/routes/routes_manger.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed  (Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          Expanded(flex: 3, child: Image.asset(AssetsManager.splashLogo)),
          Expanded(flex: 1, child: Image.asset(AssetsManager.branding)),
        ],
      ),

    );
  }
}
