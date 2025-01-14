import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/ayat.dart' as s;
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final s.Surah surah = Get.arguments;

  DetailSurahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'SURAH ${surah.name?.transliteration?.id?.toUpperCase() ?? "-"}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
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
                      surah.tafsir?.id ?? "Tidak ada tafsir pada surah ini",
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            )),
            child: Container(
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
                      style:
                          const TextStyle(fontSize: 16, color: AppStyle.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Gap(20),
          FutureBuilder<detail.DetailSurah>(
              future: controller.getDetailSurah(surah.number.toString()),
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
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.verses?.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data?.verses == null ||
                        snapshot.data?.verses?.isEmpty == true) {
                      return const SizedBox();
                    }

                    detail.Verse? ayat = snapshot.data?.verses?[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(Get.isDarkMode
                                            ? AppConst.imageListDark
                                            : AppConst.imageList),
                                        fit: BoxFit.contain),
                                  ),
                                  child: Center(child: Text("${index + 1}")),
                                ),
                                _buttonPlay(ayat?.audio?.primary),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "${ayat?.text?.arab}",
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        const Gap(10),
                        Text(
                          "${ayat?.text?.transliteration?.en}",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                        const Gap(25),
                        Text(
                          "${ayat?.translation?.id}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Gap(50)
                      ],
                    );
                  },
                );
              })
        ],
      ),
    );
  }

  Widget _buttonPlay(String? audio) {
    return Obx(() => Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_add_outlined)),
            (controller.audioCondition.value == "stop")
                ? IconButton(
                    onPressed: () {
                      controller.playAudio(audio);
                    },
                    icon: const Icon(Icons.play_arrow))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (controller.audioCondition.value == "playing")
                          ? IconButton(
                              onPressed: () {
                                controller.pauseAudio();
                              },
                              icon: const Icon(Icons.pause))
                          : IconButton(
                              onPressed: () {
                                controller.resumeAudio();
                              },
                              icon: const Icon(Icons.play_arrow)),
                      IconButton(
                          onPressed: () {
                            controller.stopAudio();
                          },
                          icon: const Icon(Icons.stop))
                    ],
                  )
          ],
        ));
  }
}
