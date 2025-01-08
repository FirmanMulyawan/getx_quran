import 'package:get/get.dart';

import '../../../../../component/config/app_const.dart';
import 'package:flutter/material.dart';

import '../surah/surah_controller.dart';
import 'juzz_controller.dart';

class JuzzView extends GetView<JuzzController> {
  final surahController = Get.find<SurahController>();

  JuzzView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          leading: Obx(() => Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(surahController.isDark.isTrue
                            ? AppConst.imageListDark
                            : AppConst.imageList))),
                child: Center(
                    child: Text(
                  "${index + 1}",
                )),
              )),
          title: Text(
            " Juzz ${index + 1}",
          ),
        );
      },
    );
  }
}
