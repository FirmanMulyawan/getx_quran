import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../../../data/models/detail_surah.dart' as detail;
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final Map<String, dynamic>? dataMapPerJuz = Get.arguments;

  DetailJuzView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juzz ${dataMapPerJuz?["juz"]}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: (dataMapPerJuz?["verses"] as List).length,
        itemBuilder: (context, index) {
          if ((dataMapPerJuz?["verses"] as List).isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          }

          Map<String, dynamic> ayat = dataMapPerJuz?["verses"][index];

          detail.DetailSurah surah = ayat["surah"];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if ((ayat["ayat"] as detail.Verse).number?.inSurah == 1)
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                                child: Text(
                                    "${(ayat['ayat'] as detail.Verse).number?.inSurah}")),
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
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_add_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.play_arrow))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${(ayat['ayat'] as detail.Verse).text?.arab}",
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              const Gap(10),
              Text(
                "${(ayat['ayat'] as detail.Verse).text?.transliteration?.en}",
                textAlign: TextAlign.end,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const Gap(25),
              Text(
                "${(ayat['ayat'] as detail.Verse).translation?.id}",
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 18),
              ),
              const Gap(50)
            ],
          );
        },
      ),
    );
  }
}
