import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/presentation/splash/splash.dart';

import '../../core/resources/colors_manger.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    void _onIntroEnd(context) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Splash()),
      );
    }
    Widget _buildImage(String assetName) {
      return Image.asset(assetName,
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
      );

    }
    Widget _buildLogo() {
      return Image.asset(
        'assets/images/islami_logo.png',
        height: 60,
        fit: BoxFit.contain,
      );
    }
    const bodyStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500 ,color: ColorsManager.gold);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,color: ColorsManager.gold),
      bodyTextStyle: bodyStyle,
      //bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: ColorsManager.black,
      imagePadding: EdgeInsets.only(top: 130, left: 16, right: 16),
      imageAlignment: Alignment.bottomCenter,
      bodyAlignment: Alignment.topCenter,
      imageFlex: 6,
      bodyFlex: 5,
    );
    return  IntroductionScreen(
     // key: introKey,
      globalBackgroundColor: ColorsManager.black,
      allowImplicitScrolling: false,
      autoScrollDuration: null,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: _buildLogo(),
          ),
        ),
      ),
      pages: [
        PageViewModel(
           title: " ",
          body:
          "Welcome To Islmi App",
          image: _buildImage('assets/images/intro_screen1.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 3,

          ),
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body:
          "We Are Very Excited To Have You In Our Community.",
          image: _buildImage('assets/images/intro_screen2.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 3,

          ),
        ),
        PageViewModel(
          title: "Reading the Quran",
          body:
          "Read, and your Lord is the Most Generous.",
          image: _buildImage('assets/images/intro_screen3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body:
          "Praise the name of your Lord, the Most High",
          image: _buildImage('assets/images/intro_screen4.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 3,

          ),
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body: "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('assets/images/intro_screen5.png'),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 3,

          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text("Back", style: TextStyle(fontWeight: FontWeight.w600 ,color: ColorsManager.gold)),
      skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600 ,color: ColorsManager.gold)),
      next: const  Text("Next", style: TextStyle(fontWeight: FontWeight.w600 ,color: ColorsManager.gold)),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600 ,color: ColorsManager.gold)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      // controlsPadding: kIsWeb
      //     ? const EdgeInsets.all(12.0)
      //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        activeColor: ColorsManager.gold,
        size: Size(7, 7),
        color: ColorsManager.grey,
        activeSize: Size(27, 14.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(

        color: ColorsManager.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

}

