import '../../../../../component/config/app_const.dart';
import '../../../../data/models/ayat.dart' as s;
import '../../../../routes/app_pages.dart';
import 'surah_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SurahView extends GetView<SurahController> {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<s.Surah>>(
        future: controller.getAllSurah(),
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
              s.Surah? surah = snapshot.data?[index];
              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.detailSurah, arguments: surah);
                },
                leading: Obx(() => Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(controller.isDark.isTrue
                                  ? AppConst.imageListDark
                                  : AppConst.imageList))),
                      child: Center(
                          child: Text(
                        "${surah?.number}",
                      )),
                    )),
                title: Text(
                  "${surah?.name?.transliteration?.id ?? '-'} ",
                ),
                subtitle: Text(
                  "${surah?.numberOfVerses} Ayat | ${surah?.revelation?.id}",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                trailing: Text(
                  "${surah?.name?.short}",
                ),
              );
            },
          );
        });
  }
}
