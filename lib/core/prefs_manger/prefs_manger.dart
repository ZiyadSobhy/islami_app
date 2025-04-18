import 'package:islami_app/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManger{

  static void addSurahIndex(int suraIndex)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndex= prefs.getStringList('mostRecentSuraIndex')??[];
    if(mostRecentSuraIndex.contains('$suraIndex')){
      mostRecentSuraIndex.remove('$suraIndex');
      mostRecentSuraIndex.add('$suraIndex');
    }
    else{
      mostRecentSuraIndex.add('$suraIndex');
    }
    prefs.setStringList('mostRecentSuraIndex', mostRecentSuraIndex);

  }
  static Future<List<SuraDM>>getMostRecentSura()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndex= prefs.getStringList('mostRecentSuraIndex')??[];
    List<SuraDM> mostRecentSuraList=[];
    for(int i=0;i<mostRecentSuraIndex.length;i++){

      int index=int.parse(mostRecentSuraIndex[i]);
      mostRecentSuraList.add(ConstantManager.suras[index]);
    }
    return mostRecentSuraList.reversed.toList();



  }


}