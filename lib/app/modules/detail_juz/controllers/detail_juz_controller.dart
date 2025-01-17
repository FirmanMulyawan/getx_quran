import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/models/detail_surah.dart';

class DetailJuzController extends GetxController {
  int index = 0;
  final player = AudioPlayer();
  Verse? lastVerse;

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
