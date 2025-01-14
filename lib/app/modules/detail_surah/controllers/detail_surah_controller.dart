import '../../../data/models/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  final player = AudioPlayer();
  RxString audioCondition = "stop".obs;

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var response = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(response.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  void playAudio(String? url) async {
    if (url != null) {
      try {
        await player.stop();
        await player.setUrl(url);
        audioCondition.value = "playing";
        await player.play();
        audioCondition.value = "stop";
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

  void pauseAudio() async {
    try {
      await player.pause();
      audioCondition.value = "pause";
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

  void resumeAudio() async {
    try {
      audioCondition.value = "playing";
      await player.play();
      audioCondition.value = "stop";
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

  void stopAudio() async {
    try {
      await player.stop();
      audioCondition.value = "stop";
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
