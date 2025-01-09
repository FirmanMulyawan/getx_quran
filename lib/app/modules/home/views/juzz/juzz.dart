import 'package:get/get.dart';

import '../../../../../component/config/app_const.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/juzz.dart' as juzz;
import '../../../../routes/app_pages.dart';
import '../surah/surah_controller.dart';
import 'juzz_controller.dart';

class JuzzView extends GetView<JuzzController> {
  final surahController = Get.find<SurahController>();

  JuzzView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<juzz.JuzzQuran>>(
        future: controller.getAllJuzz(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Text("Tidak ada data");
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              juzz.JuzzQuran? detailJuzz = snapshot.data?[index];

              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.detailJuz, arguments: detailJuzz);
                },
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
                isThreeLine: true,
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mulai dari ${detailJuzz?.juzStartInfo}",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      "Sampai ${detailJuzz?.juzEndInfo}",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
