import 'package:flutter/material.dart';
import 'package:islami_app/core/constant.dart';
import '../../../../../DM/quran_detailsDM.dart';
import '../../../../../core/prefs_manger/prefs_manger.dart';
import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/routes/routes_manger.dart';
import 'most_recent_card.dart';


class SuraWidget extends StatelessWidget {
  const SuraWidget({super.key, required this.suraDM, required this.mostRecentKey});
  final SuraDM suraDM;
  final GlobalKey<MostRecentState>? mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        int suraIndex = int.parse(suraDM.suraIndex) - 1;
        PrefsManger.addSurahIndex(suraIndex);
        Navigator.pushNamed(
          context,
          RoutesManager.quranDetail,
          arguments: QuranDetailsArguments(
            suraDM: suraDM,
            mostRecentKey: mostRecentKey!,
          ),
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumberBackground),
              Text(
                suraDM.suraIndex,
                style: TextStyle(color: ColorsManager.white, fontSize: 14),
              )
            ],
          ),
          SizedBox(width: 24),
          Column(
            children: [
              Text(
                suraDM.suraNameEn,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorsManager.white),
              ),
              Text(
                suraDM.versesNumber,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorsManager.white),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraDM.suraNameAr,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: ColorsManager.white),
          )
        ],
      ),
    );
  }
}
