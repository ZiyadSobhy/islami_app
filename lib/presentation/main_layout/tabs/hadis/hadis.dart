
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/presentation/main_layout/tabs/hadis/widgets/hadis_card.dart';

class Hadis extends StatelessWidget {
  const Hadis({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.hadisBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsManager.islamiLogo),
          SizedBox(height: 14,),
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
                height: 400),


            items: List.generate(
              50,
              (index) => HadisCard(index: index+1,)
            ),

          )

        ],
      ),
    );
  }
}
