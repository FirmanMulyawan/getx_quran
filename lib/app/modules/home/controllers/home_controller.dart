import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../component/config/app_theme.dart';
import '../views/surah/surah_controller.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  final surahController = Get.find<SurahController>();

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
