import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../data/models/detail_surah.dart' as detail;
import '../../../data/models/surah.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;

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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "${surah.name?.transliteration?.id?.toUpperCase()}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "( ${surah.name?.translation?.id?.toUpperCase()} )",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Text(
                    "${surah.numberOfVerses} Ayat | ${surah.revelation?.id}",
                    style: const TextStyle(fontSize: 16),
                  )
                ],
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
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(child: Text("${index + 1}")),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_add_outlined)),
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
                        Text(
                          "${ayat?.text?.arab}",
                          style: const TextStyle(fontSize: 25),
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
                          textAlign: TextAlign.justify,
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
}
