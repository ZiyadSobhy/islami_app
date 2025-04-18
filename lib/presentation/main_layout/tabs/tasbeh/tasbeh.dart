import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/resources/assets_manger.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  int counter = 0;
  int maxCounter = 33;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.backgroundTasbeh),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AssetsManager.islamiLogo),
          SizedBox(height: 16),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: GoogleFonts.aBeeZee(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (counter < maxCounter) {
                      counter++;
                    } else {
                      counter = 0;
                    }
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    for (int i = 0; i < counter; i++)
                      Transform.translate(
                        offset: Offset(
                          120 * cos(2 * pi * i / maxCounter),
                          120 * sin(2 * pi * i / maxCounter),
                        ),
                        child: Image.asset(
                          AssetsManager.tasbeh,
                          width: 44,
                          height: 44,
                        ),
                      ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Column(children: [
                        Text('سبحان الله',style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                        SizedBox(height: 8),
                        Text('$counter',style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),

                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
