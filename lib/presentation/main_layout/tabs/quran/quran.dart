import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';
import 'package:islami_app/presentation/main_layout/tabs/quran/widgets/most_recent_card.dart';
import 'package:islami_app/presentation/main_layout/tabs/quran/widgets/sura_widget.dart';

import '../../../../core/constant.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  String searchText = '';
  List<SuraDM> filteredSuras = ConstantManager.suras;
  GlobalKey<MostRecentState>mostRecentKey = GlobalKey<MostRecentState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(AssetsManager.quranTabBackground).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.islamiLogo),
              buildSearchField(),
              SizedBox(height: 14),
              Text(
                "Most Recent",
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

               MostRecent(key: mostRecentKey,),

              SizedBox(height: 20),
              Text(
                'Suras List',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorsManager.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  height: 14,
                  endIndent: 64,
                  indent: 64,
                ),
                itemBuilder: (context, index) =>
                    SuraWidget(
                        mostRecentKey: mostRecentKey,
                        suraDM: filteredSuras[index]
                    ),
                itemCount: filteredSuras.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchField() {
    return SizedBox(
      height: 50,
      child: TextField(
        onChanged: (userInput) {
          setState(() {
            searchText = userInput;
            filteredSuras = ConstantManager.suras.where((suraDm) =>
            suraDm.suraNameEn
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
                suraDm.suraNameAr
                    .toLowerCase()
                    .contains(searchText.toLowerCase())).toList();
          });
        },
        style: TextStyle(
          color: ColorsManager.gold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          label: Text('Search in Quran'),
          labelStyle: TextStyle(
            color: ColorsManager.gold,
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorsManager.gold,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorsManager.gold,
              width: 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorsManager.gold,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
