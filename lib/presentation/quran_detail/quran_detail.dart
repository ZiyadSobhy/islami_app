import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';
import '../../core/constant.dart';

class QuranDetail extends StatefulWidget {
  const QuranDetail({super.key});

  @override
  State<QuranDetail> createState() => _QuranDetailState();
}

class _QuranDetailState extends State<QuranDetail> {
  late SuraDM arguments;
  String surahContent = 'Loading...'; // Default text

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as SuraDM;
    buildSuraContent(int.parse(arguments.suraIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        iconTheme: IconThemeData(color: ColorsManager.gold),
        titleTextStyle: TextStyle(
          color: ColorsManager.gold,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        title: Text(arguments.suraNameEn),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsManager.suraImageDetail),
              ),
              Center(
                child: Text(
                  arguments.suraNameAr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.gold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/Mask group.png'),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                surahContent,
                style: TextStyle(
                  fontSize: 24,
                  color: ColorsManager.gold,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buildSuraContent(int suraIndex) async {

      String fileContent = await rootBundle.loadString('assets/files/suras/$suraIndex.txt');
      var suraLines = fileContent.trim().split('\n');
      List<String> surahLinesFinal = [];

      for (int i = 0; i < suraLines.length; i++) {
        if (suraLines[i].trim().isEmpty) continue;
        surahLinesFinal.add('${suraLines[i].trim()} ۩${i + 1}۩');
      }

      setState(() {
        surahContent = surahLinesFinal.join('\n\n');
      });

  }
}