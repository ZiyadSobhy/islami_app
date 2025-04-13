import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';
import 'package:islami_app/presentation/main_layout/tabs/hadis/hadis.dart';
import 'package:islami_app/presentation/main_layout/tabs/quran/quran.dart';
import 'package:islami_app/presentation/main_layout/tabs/radio/radio.dart';
import 'package:islami_app/presentation/main_layout/tabs/tasbeh/tasbeh.dart';
import 'package:islami_app/presentation/main_layout/tabs/time/time.dart';

class MainLayout extends StatefulWidget {
    MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs=[
      Quran(),
      Hadis(),
      Tasbeh(),
      Time(),
      RadioTab(),

    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.black.withOpacity(0.7),
            ColorsManager.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: tabs[currentIndex], // Display the selected tab's content

      ),

    );

  }
  Widget buildBottomNavigationBar(){
    return BottomNavigationBar( backgroundColor :ColorsManager.gold,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      currentIndex: currentIndex,
      unselectedItemColor: ColorsManager.black,

      onTap: (int newIndexTab){
        setState(() {
          currentIndex = newIndexTab;
          print('currentIndex: $currentIndex');
        });



      },
      items: [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManager.quranIcon)), label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManager.hadithIcon)), label: "Hadis"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManager.sebhaIcon)), label: "Tasbeh"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManager.timeIcon)), label: "Time"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AssetsManager.radioIcon)), label: "Radio"),
      ],



    );
  }

}
