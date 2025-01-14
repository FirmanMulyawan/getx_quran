import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../views/juzz/juzz_controller.dart';
import '../views/juzz_v2/juzz_v2_controller.dart';
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
    Get.lazyPut<JuzzV2Controller>(
      () => JuzzV2Controller(),
    );
  }
}
