import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/resources/colors_manger.dart';
import '../../../../../core/routes/routes_manger.dart';
import '../hadis_content.dart';

class HadisCard extends StatefulWidget {
  const HadisCard({super.key, required this.index});

  final int index;

  @override
  State<HadisCard> createState() => _HadisCardState();
}

class _HadisCardState extends State<HadisCard> {
  late HadisDm hadisDm;

  @override
  void initState() {
    super.initState();
    hadisDm = HadisDm(title: 'Loading...', content: 'Loading...');
    loadHadis();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutesManager.hadithDetails,
          arguments: hadisDm,
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: ColorsManager.gold,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/image_detail.png',
                      color: ColorsManager.black,
                    ),
                    Image.asset(
                      'assets/images/Mask group.png',
                      color: ColorsManager.black,
                    ),
                  ],
                ),
                Text(
                  hadisDm.title,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Wrap HadithContent inside a SingleChildScrollView or Expanded
            Expanded(
              child: SingleChildScrollView(
                child: HadithContent(
                  content: hadisDm.content,
                  maxLines: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
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
