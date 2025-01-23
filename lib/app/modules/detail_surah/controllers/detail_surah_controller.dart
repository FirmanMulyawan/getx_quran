import 'package:alquran/app/data/db/bookmark.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../component/config/app_style.dart';
import '../../../data/models/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  final player = AudioPlayer();
  Verse? lastVerse;

  DatabaseManager database = DatabaseManager.instance;

  Future<void> addBookmark(
      bool lastRead, DetailSurah surah, Verse? ayat, int indexAyat) async {
    Database db = await database.db;

    bool flagExist = false;

    if (lastRead == true) {
      await db.delete("bookmark", where: "last_read = 1");
    } else {
      List<Map<String, Object?>> checkData = await db.query("bookmark",
          columns: ["surah", "ayat", "juz", "via", "index_ayat", "last_read"],
          where:
              "surah = '${surah.name?.transliteration?.id?.replaceAll("'", "+")}' and ayat = ${ayat?.number?.inSurah} and juz = ${ayat?.meta?.juz} and via = 'surah' and index_ayat = $indexAyat and last_read = 0");
      if (checkData.isNotEmpty) {
        flagExist = true;
      }
    }

    if (flagExist == false) {
      await db.insert("bookmark", {
        "surah": "${surah.name?.transliteration?.id?.replaceAll("'", "+")}",
        "ayat": ayat?.number?.inSurah,
        "juz": ayat?.meta?.juz,
        "via": "surah",
        "index_ayat": indexAyat,
        "last_read": lastRead == true ? 1 : 0
      });

      Get.back();
      Get.snackbar("Berhasil", "Berhasil menambahkan bookmark",
          colorText: AppStyle.white);
    } else {
      Get.back();
      Get.snackbar("Terjadi kesalahan", "Bookmark telah tersedia",
          colorText: AppStyle.white);
    }
  }

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var response = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(response.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  void playAudio(Verse? ayat) async {
    if (ayat?.audio?.primary != null) {
      try {
        // ignore: prefer_conditional_assignment
        if (lastVerse == null) {
          lastVerse = ayat;
        }
        lastVerse?.audioCondition = "stop";
        lastVerse = ayat;
        lastVerse?.audioCondition = "stop";
        update();
        await player.stop();
        await player.setUrl(ayat?.audio?.primary ?? "");
        ayat?.audioCondition = "playing";
        update();
        await player.play();
        ayat?.audioCondition = "stop";
        update();
        await player.stop();
      } on PlayerException catch (e) {
        Get.defaultDialog(
            title: "Terjadi kesalahan", middleText: e.message.toString());
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "Connection aborted ${e.message.toString()}");
      } catch (e) {
        Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "Tidak dapat memutar audio");
      }
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "URL audio tidak ada / tidak dapat diakses");
    }
  }

  void pauseAudio(Verse? ayat) async {
    try {
      await player.pause();
      ayat?.audioCondition = "pause";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Connection aborted ${e.message.toString()}");
    } catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Tidak dapat pause audio");
    }
  }

  void resumeAudio(Verse? ayat) async {
    try {
      ayat?.audioCondition = "playing";
      update();
      await player.play();
      ayat?.audioCondition = "stop";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Connection aborted ${e.message.toString()}");
    } catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Tidak dapat pause audio");
    }
  }

  void stopAudio(Verse? ayat) async {
    try {
      await player.stop();
      ayat?.audioCondition = "stop";
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Connection aborted ${e.message.toString()}");
    } catch (e) {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Tidak dapat pause audio");
    }
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
