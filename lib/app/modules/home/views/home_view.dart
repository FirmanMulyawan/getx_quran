import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../../../../component/config/app_theme.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
// import 'juzz/juzz.dart';
import 'bookmark/bookmark.dart';
import 'juzz_v2/juzz_v2.dart';
import 'surah/surah.dart';
import 'surah/surah_controller.dart';

class HomeView extends GetView<HomeController> {
  final surahController = Get.find<SurahController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      surahController.isDark.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Al Quran Apps'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.searchSurah),
              icon: const Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: controller.selectedIndex.value,
        child: Padding(
          padding: const EdgeInsets.only(
              top: AppTheme.textSize2Xl,
              left: AppTheme.textSize2Xl,
              right: AppTheme.textSize2Xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Assalamualaikum",
                style: TextStyle(
                    fontSize: AppTheme.textSize2Xl,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              _buttonLastRead(),
              const Gap(20),
              TabBar(
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (value) {
                    controller.selectedIndex.value = value;
                  },
                  // indicator: BoxDecoration(
                  //   color: Colors.blueAccent,
                  //   borderRadius: BorderRadius.circular(10),
                  //   border: Border.all(color: Colors.black, width: 2),
                  // ),
                  tabs: const [
                    Tab(
                      text: "Surah",
                    ),
                    Tab(
                      text: "Juzz",
                    ),
                    Tab(
                      text: "Bookmark",
                    ),
                  ]),
              Expanded(
                child: Obx(() => LazyIndexedStack(
                        index: controller.selectedIndex.value,
                        children: [
                          const SurahView(),
                          // JuzzView(),
                          JuzzV2View(),
                          BookmarkView(),
                        ])),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeThemeMode(),
        child: Obx(() => Icon(Icons.color_lens,
            color: surahController.isDark.isTrue
                ? AppStyle.purpleDark
                : AppStyle.white)),
      ),
    );
  }

  Widget _buttonLastRead() {
    return FutureBuilder<Map<String, dynamic>?>(
        future: controller.getLastRead(),
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          Map<String, dynamic>? lastRead = snapshot.data;

          return Skeletonizer(
            enabled: isLoading,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [
                    AppStyle.purpleLight1,
                    AppStyle.purpleDark,
                  ])),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onLongPress: isLoading
                      ? null
                      : () {
                          if (lastRead != null) {
                            Get.defaultDialog(
                                title: "Delete Last Read",
                                middleText:
                                    "Are you sure want to delete last read?",
                                actions: [
                                  OutlinedButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                        controller
                                            .deleteLastRead(lastRead['id']);
                                      },
                                      child: const Text("Delete"))
                                ]);
                          }
                        },
                  onTap: isLoading
                      ? null
                      : () {
                          if (lastRead != null) {}
                        },
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: -50,
                          right: 0,
                          child: Opacity(
                            opacity: 0.7,
                            child: Skeleton.keep(
                              child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                    AppConst.imageAlquran,
                                    fit: BoxFit.contain,
                                  )),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.menu_book_rounded,
                                  color: Colors.white,
                                ),
                                Gap(10),
                                Text(
                                  "Terakhir di baca",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const Gap(30),
                            Text(
                              lastRead == null
                                  ? "Belum ada"
                                  : lastRead['surah']
                                      .toString()
                                      .replaceAll("+", "'"),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: AppTheme.textSize2Xl),
                            ),
                            Text(
                              lastRead == null
                                  ? "Belum ada data"
                                  : "Juz ${lastRead['juz']} | Ayat ${lastRead['ayat']}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
