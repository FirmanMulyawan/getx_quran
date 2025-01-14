import 'package:get/get.dart';

import '../../../../../component/config/app_const.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/detail_surah.dart' as detail;
import '../../../../routes/app_pages.dart';
import '../surah/surah_controller.dart';
import 'juzz_v2_controller.dart';

class JuzzV2View extends GetView<JuzzV2Controller> {
  final surahController = Get.find<SurahController>();

  JuzzV2View({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
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
            Map<String, dynamic>? dataMapPerJuz = snapshot.data?[index];
            return ListTile(
              onTap: () {
                Get.toNamed(Routes.detailJuz, arguments: dataMapPerJuz);
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
                    "Mulai dari ${(dataMapPerJuz?["start"]["surah"] as detail.DetailSurah).name?.transliteration?.id} ayat ${(dataMapPerJuz?["start"]["ayat"] as detail.Verse).number?.inSurah}",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Text(
                    "Sampai ${(dataMapPerJuz?["end"]["surah"] as detail.DetailSurah).name?.transliteration?.id} ayat ${(dataMapPerJuz?["end"]["ayat"] as detail.Verse).number?.inSurah}",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
