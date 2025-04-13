import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';

class HadisCard extends StatefulWidget {
  const HadisCard({super.key, required this.index});

  final int index;

  @override
  State<HadisCard> createState() => _HadisCardState();
}

class _HadisCardState extends State<HadisCard> {
  late HadisDm hadisDm; // Changed to late since we initialize it in initState

  @override
  void initState() {
    super.initState();
    hadisDm = HadisDm(title: 'Loading...', content: 'Loading...');
    loadHadis();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetsManager.suraImageDetail),
              Text(
                hadisDm.title,
                style: TextStyle(
                  color: ColorsManager.gold,
                  fontSize: 20,
                ),
              ),
              Image.asset('assets/images/Mask group.png'),
            ],
          ),
          // Add content display if needed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(hadisDm.content),
          ),
        ],
      ),
    );
  }

  Future<void> loadHadis() async {
    try {
      String fileContent = await rootBundle.loadString(
        'assets/files/hadeeth/h${widget.index}.txt',
      );
      List<String> hadisLine = fileContent.trim().split('\n');
      String hadisTitle = hadisLine[0];
      hadisLine.removeAt(0);
      String content = hadisLine.join('\n');

      setState(() {
        hadisDm = HadisDm(title: hadisTitle, content: content);
      });
    } catch (e) {
      setState(() {
        hadisDm = HadisDm(
          title: 'Error',
          content: 'Failed to load hadis: $e',
        );
      });
    }
  }
}

class HadisDm {
  final String title;
  final String content;

  HadisDm({required this.title, required this.content});
}