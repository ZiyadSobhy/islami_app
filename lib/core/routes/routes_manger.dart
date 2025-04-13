import 'package:flutter/material.dart';
import 'package:islami_app/presentation/main_layout/tabs/hadis/widgets/hadis_detail.dart';

import '../../presentation/main_layout/main_layout.dart';
import '../../presentation/quran_detail/quran_detail.dart';
import '../../presentation/splash/splash.dart';

class RoutesManager{

  static const String splash = "/";
  static const String mainLayout = "/mainLayout";
  static const String quranDetail='QuranDetail';
  static const String hadithDetails='HadisDetail';
  static Map<String, WidgetBuilder> router = {
    splash: (_) => const Splash(),
    mainLayout: (_) => MainLayout(),
    quranDetail: (_) => QuranDetail(),
    hadithDetails: (_) => const HadithDetails(),
  };

}