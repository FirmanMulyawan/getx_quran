import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../../home/controllers/home_controller.dart';
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final Map<String, dynamic>? dataMapPerJuz = Get.arguments;
  final homeController = Get.find<HomeController>();

  DetailJuzView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juzz ${dataMapPerJuz?["juz"]}'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (dataMapPerJuz?["verses"] as List).length,
            itemBuilder: (context, index) {
              if ((dataMapPerJuz?["verses"] as List).isEmpty) {
                return const Center(child: Text("Tidak ada data"));
              }

              Map<String, dynamic> ayat = dataMapPerJuz?["verses"][index];

              detail.DetailSurah surah = ayat["surah"];
              detail.Verse verse = ayat["ayat"];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (verse.number?.inSurah == 1)
                    GestureDetector(
                      onTap: () => Get.dialog(Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Get.isDarkMode
                                ? AppStyle.purpleLight2.withOpacity(0.3)
                                : AppStyle.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Tafsir ${surah.name?.transliteration?.id}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                surah.tafsir?.id ??
                                    "Tidak ada tafsir pada surah ini",
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                        ),
                      )),
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            AppStyle.purpleLight1,
                            AppStyle.purpleDark,
                          ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "${surah.name?.transliteration?.id?.toUpperCase()}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppStyle.white),
                              ),
                              Text(
                                "( ${surah.name?.translation?.id?.toUpperCase()} )",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppStyle.white),
                              ),
                              const Gap(10),
                              Text(
                                "${surah.numberOfVerses} Ayat | ${surah.revelation?.id}",
                                style: const TextStyle(
                                    fontSize: 16, color: AppStyle.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppStyle.purpleLight2.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Get.isDarkMode
                                          ? AppConst.imageListDark
                                          : AppConst.imageList),
                                      fit: BoxFit.contain),
                                ),
                                child: Center(
                                    child: Text("${verse.number?.inSurah}")),
                              ),
                              Text(
                                "${surah.name?.transliteration?.id}",
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          _buttonPlay(verse, surah, index),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "${verse.text?.arab}",
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    "${verse.text?.transliteration?.en}",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  const Gap(25),
                  Text(
                    "${verse.translation?.id}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Gap(50)
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buttonPlay(detail.Verse verse, detail.DetailSurah surah, int index) {
    return GetBuilder<DetailJuzController>(
      builder: (ctrl) {
        return Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "BOOKMARK",
                      middleText: "Pilih jenis bookmark",
                      actions: [
                        ElevatedButton(
                          onPressed: () async {
                            await controller.addBookmark(
                                true, surah, verse, index);
                            homeController.update();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyle.purple,
                          ),
                          child: const Text(
                            "LAST READ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.addBookmark(false, surah, verse, index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyle.purple,
                          ),
                          child: const Text(
                            "BOOKMARK",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]);
                },
                icon: const Icon(Icons.bookmark_add_outlined)),
            (verse.audioCondition == "stop")
                ? IconButton(
                    onPressed: () {
                      ctrl.playAudio(verse);
                    },
                    icon: const Icon(Icons.play_arrow))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (verse.audioCondition == "playing")
                          ? IconButton(
                              onPressed: () {
                                ctrl.pauseAudio(verse);
                              },
                              icon: const Icon(Icons.pause))
                          : IconButton(
                              onPressed: () {
                                ctrl.resumeAudio(verse);
                              },
                              icon: const Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () {
                            ctrl.stopAudio(verse);
                          },
                          icon: const Icon(Icons.stop))
                    ],
                  )
          ],
        );
      },
    );
  }
}
