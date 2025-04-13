import 'package:flutter/material.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../hadis_content.dart';
import 'hadis_card.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  late HadisDm hadithDM;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is HadisDm) {
      hadithDM = args;
    } else {
      // fallback in case of missing/invalid arguments
      hadithDM = HadisDm(
        title: 'خطأ في التحميل',
        content: 'لا يوجد حديث لعرضه.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hadithDM.title),
        backgroundColor: ColorsManager.gold,
        foregroundColor: ColorsManager.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
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
                      color: ColorsManager.gold.withOpacity(0.8),
                      width: 40,
                    ),
                    Image.asset(
                      'assets/images/Mask group.png',
                      color: ColorsManager.gold.withOpacity(0.8),
                      width: 40,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    hadithDM.title,
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: HadithContent(
                  content: hadithDM.content,
                  contentColor: ColorsManager.gold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
