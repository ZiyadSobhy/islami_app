import 'package:flutter/material.dart';
import 'package:islami_app/core/constant.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/routes/routes_manger.dart';

class SuraWidget extends StatelessWidget {
  const SuraWidget({super.key,required this.suraDM});
  final SuraDM suraDM;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Navigator.pushNamed(context, RoutesManager.quranDetail,arguments:suraDM );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.suraNumberBackground),
              Text(suraDM.suraIndex,style: TextStyle(color: ColorsManager.white,fontSize: 14),)
            ],
          ),
          SizedBox(width: 24,),
          Column(
            children: [
              Text(suraDM.suraNameEn,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorsManager.white),),
              Text(suraDM.versesNumber,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorsManager.white),),
            ],
          ),
          Spacer(),
          Text(suraDM.suraNameAr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: ColorsManager.white),)

        ],
      ),
    );
  }
}
