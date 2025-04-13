import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/colors_manger.dart';

class MostRecentCard extends StatelessWidget {
  const MostRecentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width*0.7,

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: ColorsManager.gold,
        elevation: 4,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Al-Anbiya',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'الأنبياء',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '112 Verse',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(AssetsManager.mostRecentSuraCard),
            ),
          ],
        ),
      ),
    );

  }
}
