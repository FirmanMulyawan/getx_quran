import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../data/models/detail_surah.dart';

class JuzzV2Controller extends GetxController {
  Future<List<Map<String, dynamic>>> getAllJuzz() async {
    int juz = 1;

    List<Map<String, dynamic>> penampungAyat = [];
    List<Map<String, dynamic>> allJuzz = [];

    for (var i = 1; i <= 114; i++) {
      Uri url = Uri.parse("https://api.quran.gading.dev/surah/$i");
      var response = await http.get(url);
      Map<String, dynamic> rawData = json.decode(response.body)["data"];
      DetailSurah data = DetailSurah.fromJson(rawData);

      if (data.verses != null) {
        data.verses?.forEach((ayat) {
          if (ayat.meta?.juz == juz) {
            penampungAyat.add({"surah": data, "ayat": ayat});
          } else {
            allJuzz.add({
              "juz": juz,
              "start": penampungAyat[0],
              "end": penampungAyat[penampungAyat.length - 1],
              "verses": penampungAyat
            });
            juz++;
            penampungAyat = [];
            penampungAyat.add({"surah": data, "ayat": ayat});
          }
        });
      }
    }

    allJuzz.add({
      "juz": juz,
      "start": penampungAyat[0],
      "end": penampungAyat[penampungAyat.length - 1],
      "verses": penampungAyat
    });

    return allJuzz;
  }
}
