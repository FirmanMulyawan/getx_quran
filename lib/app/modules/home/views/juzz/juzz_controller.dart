import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../data/models/juzz.dart';

class JuzzController extends GetxController {
  Future<List<JuzzQuran>> getAllJuzz() async {
    List<JuzzQuran> allJuzz = [];

    for (int index = 1; index <= 30; index++) {
      Uri url = Uri.parse("https://api.quran.gading.dev/juz/$index");
      var response = await http.get(url);
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>)["data"];

      JuzzQuran juzz = JuzzQuran.fromJson(data);

      allJuzz.add(juzz);
    }
    return allJuzz;
  }
}
