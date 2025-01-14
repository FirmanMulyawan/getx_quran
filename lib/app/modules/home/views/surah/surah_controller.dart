import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../data/models/ayat.dart';

class SurahController extends GetxController {
  RxBool isDark = false.obs;
  List<Surah> allSurah = [];

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var response = await http.get(url);

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }
}
