import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:gap/gap.dart';

import '../../../../component/config/app_const.dart';
import '../../../../component/config/app_style.dart';
import '../../../../component/config/app_theme.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'juzz/juzz.dart';
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
              Container(
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
                    onTap: () => Get.toNamed(Routes.lastRead),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: -50,
                            right: 0,
                            child: Opacity(
                              opacity: 0.7,
                              child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                    AppConst.imageAlquran,
                                    fit: BoxFit.contain,
                                  )),
                            )),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
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
                              Gap(30),
                              Text(
                                "Al-Fatihah",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppTheme.textSize2Xl),
                              ),
                              Text(
                                "Juz 1 | Ayat 5",
                                style: TextStyle(
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
                          JuzzView(),
                          const Text("page 3"),
                        ])),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.isDarkMode
              ? Get.changeTheme(AppTheme.themeLight)
              : Get.changeTheme(AppTheme.themeDark);
          surahController.isDark.toggle();
        },
        child: Obx(() => Icon(Icons.color_lens,
            color: surahController.isDark.isTrue
                ? AppStyle.purpleDark
                : AppStyle.white)),
      ),
    );
  }
}
