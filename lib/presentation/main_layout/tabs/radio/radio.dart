import 'package:flutter/material.dart';
import 'package:islami_app/core/resources/assets_manger.dart';
import 'package:islami_app/core/resources/colors_manger.dart';
import 'package:islami_app/presentation/main_layout/tabs/radio/widgets/tabs/radio.dart';
import 'package:islami_app/presentation/main_layout/tabs/radio/widgets/tabs/reciters.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final List<Tab> tabs = const [Tab(text: " Radio"), Tab(text: "Reciters")];

  final List<Widget> tabViews = const [RadioTabe(), Reciters()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.radioBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(AssetsManager.islamiLogo),
            const SizedBox(height: 12),

            buildCustomTabBar(tabs),

            const SizedBox(height: 16),

            Expanded(child: TabBarView(children: tabViews)),
          ],
        ),
      ),
    );
  }

  Widget buildCustomTabBar(List<Tab> tabs) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TabBar(
          tabs: tabs,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: ColorsManager.white,
          labelColor: ColorsManager.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            color: ColorsManager.gold,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
