import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';

class CardRadio extends StatelessWidget {
  const CardRadio({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(AssetsManager.mosque),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(

          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Icon(Icons.play_arrow, color: ColorsManager.black),
              Icon(Icons.volume_down_sharp)

            ]),
          ],
        ),
      ),
    );
  }
}
