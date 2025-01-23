import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../component/config/app_style.dart';
import '../../../../component/config/app_theme.dart';
import '../../../data/db/bookmark.dart';
import '../views/surah/surah_controller.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  final surahController = Get.find<SurahController>();
  DatabaseManager database = DatabaseManager.instance;

  Future<Map<String, dynamic>?> getLastRead() async {
    await Future.delayed(const Duration(seconds: 2));
    Database db = await database.db;
    List<Map<String, dynamic>> datalastRead =
        await db.query("bookmark", where: "last_read == 1");
    if (datalastRead.isEmpty) {
      return null;
    } else {
      return datalastRead.first;
    }
  }

  void deleteLastRead(int id) async {
    Database db = await database.db;
    await db.delete("bookmark", where: "id=$id");
    update();
    Get.back();
    Get.snackbar("Berhasil", "Telah berhasil menghapus Last Read",
        colorText: AppStyle.white);
  }

  void changeThemeMode() async {
    Get.isDarkMode
        ? Get.changeTheme(AppTheme.themeLight)
        : Get.changeTheme(AppTheme.themeDark);
    surahController.isDark.toggle();

    final box = GetStorage();
    if (Get.isDarkMode) {
      box.remove("themeDark");
    } else {
      box.write("themeDark", true);
    }
  }
}
