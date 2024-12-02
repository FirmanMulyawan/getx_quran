import 'dart:convert';

import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");
  var response = await http.get(url);
  var data = (json.decode(response.body) as Map<String, dynamic>)["data"];

  // print(data[113]);

  // data dari api (raw data) -> Model
  Surah surahAnnas = Surah.fromJson(data[113]);

  // print(surahAnnas.toJson());

  Uri urlAnnas =
      Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  var responseAnnas = await http.get(urlAnnas);
  Map<String, dynamic> dataAnnas =
      (json.decode(responseAnnas.body) as Map<String, dynamic>)["data"];

  DetailSurah annas = DetailSurah.fromJson(dataAnnas);
  print(annas.toJson());
}
