import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../views/juzz/juzz_controller.dart';
import '../views/surah/surah_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SurahController>(
      () => SurahController(),
    );
    Get.lazyPut<JuzzController>(
      () => JuzzController(),
    );
  }
}
