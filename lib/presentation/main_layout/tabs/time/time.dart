import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';

class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(AssetsManager.timeBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(AssetsManager.islamiLogo),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: ColorsManager.gold,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  buildTopRow(),
                  const SizedBox(height: 12),
                  buildBottomRow(),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: List.generate(
                        5,
                            (index) => buildPrayerTimeItem('Fajr', '05:00'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildAzkarSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('16 Jul', style: TextStyle(fontSize: 20, color: ColorsManager.white)),
        Text('Pray Time', style: TextStyle(fontSize: 20, color: ColorsManager.white)),
        Text('09 Much', style: TextStyle(fontSize: 20, color: ColorsManager.white)),
      ],
    );
  }

  Widget buildBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('2024', style: TextStyle(fontSize: 20, color: ColorsManager.white)),
        Text('Tuesday', style: TextStyle(fontSize: 20, color: ColorsManager.white)),
        Text('1446', style: TextStyle(fontSize: 20, color: ColorsManager.white)),
      ],
    );
  }

  Widget buildPrayerTimeItem(String name, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: const LinearGradient(
          colors: [ColorsManager.gold, ColorsManager.black],
        ),
        border: Border.all(color: ColorsManager.white, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsManager.white)),
            const SizedBox(height: 6),
            Text(time, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsManager.white)),
          ],
        ),
      ),
    );
  }

  Widget buildAzkarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Azkar',
          style: TextStyle(
            color: ColorsManager.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: buildAzkarCard(
                title: 'Evening Azkar',
                imagePath: AssetsManager.azkarELsabah,
                onTap: () {

                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: buildAzkarCard(
                title: 'Morning Azkar',
                imagePath: AssetsManager.azkarElmasaa,
                onTap: () {
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildAzkarCard({
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorsManager.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorsManager.gold, width: 1.5),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
