import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';
import 'package:islami_app/presentation/main_layout/tabs/quran/widgets/most_recent_card.dart';
import 'package:islami_app/presentation/main_layout/tabs/quran/widgets/sura_widget.dart';

import '../../../../core/constant.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset(AssetsManager.quranTabBackground).image, fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.islamiLogo),
              buildSearchField(),
              SizedBox(height: 14,),
              Text("Most Recent",style: TextStyle(color: ColorsManager.white,fontSize: 18),),
              SizedBox(height: 10,),
              SizedBox(
                height: MediaQuery.sizeOf(context).height*0.2,
                  child: ListView.builder(itemBuilder: (context,index)=> MostRecentCard(),itemCount: 7,scrollDirection: Axis.horizontal,)),
              SizedBox(height: 10,),
              Text('Suras List',style: TextStyle(fontSize: 20,color: ColorsManager.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 14,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                  height: 14,
                  endIndent: 64,
                  indent: 64,

                ),

                itemBuilder: (context, index) => SuraWidget(suraDM: ConstantManager.suras[index],),itemCount: ConstantManager.suras.length,),
          
          
          
          
            ],
          ),
        ),
      ),
    );
  }

  buildSearchField() {
    return SizedBox(
      height: 50,
      child: TextField(
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
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorsManager.gold,
              width: 2,
            ),
          ),
          disabledBorder:  OutlineInputBorder(
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
