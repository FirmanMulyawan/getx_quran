import '../../../../../component/config/app_const.dart';
import '../../../../../component/config/app_style.dart';
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
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Get.isDarkMode
                              ? AppConst.imageListDark
                              : AppConst.imageList))),
                  child: Center(
                      child: Text(
                    "${surah?.number}",
                    style: TextStyle(
                      color:
                          Get.isDarkMode ? AppStyle.white : AppStyle.purpleDark,
                    ),
                  )),
                ),
                title: Text(
                  "${surah?.name?.transliteration?.id ?? '-'} ",
                  style: TextStyle(
                    color:
                        Get.isDarkMode ? AppStyle.white : AppStyle.purpleDark,
                  ),
                ),
                subtitle: Text(
                  "${surah?.numberOfVerses} Ayat | ${surah?.revelation?.id}",
                ),
                trailing: Text(
                  "${surah?.name?.short}",
                  style: TextStyle(
                    color:
                        Get.isDarkMode ? AppStyle.white : AppStyle.purpleDark,
                  ),
                ),
              );
            },
          );
        });
  }
}
