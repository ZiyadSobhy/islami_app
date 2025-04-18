import 'package:flutter/material.dart';
import '../../../../../core/prefs_manger/prefs_manger.dart';
import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/constant.dart';

class MostRecent extends StatefulWidget {
  const MostRecent({super.key});

  @override
  State<MostRecent> createState() => MostRecentState();
}

class MostRecentState extends State<MostRecent> {
  List<SuraDM> mostRecentSuras = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshMostRecentSuras();
  }


  void refreshMostRecentSuras() async {
    mostRecentSuras = await PrefsManger.getMostRecentSura();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return mostRecentSuras.isEmpty
        ? Container(
      alignment: Alignment.center,
      child: Text(
        "There's no most recently now",
        style: TextStyle(
            fontSize: 12,
            color: ColorsManager.gold,
            fontWeight: FontWeight.w500),
      ),
    )
        : SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: buildMostRecentCard(mostRecentSuras[index])),
        itemCount: mostRecentSuras.length,
      ),
    );
  }

  Widget buildMostRecentCard(SuraDM suraDM) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.gold,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  suraDM.suraNameEn,
                  style: TextStyle(
                      fontSize: 24,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  suraDM.suraNameAr,
                  style: TextStyle(
                      fontSize: 24,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "${suraDM.versesNumber} Verses",
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset(AssetsManager.mostRecentSuraCard))
        ],
      ),
    );
  }
}
