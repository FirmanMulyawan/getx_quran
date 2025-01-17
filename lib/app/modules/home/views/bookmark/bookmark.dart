import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../component/config/app_const.dart';
import '../surah/surah_controller.dart';
import 'bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  final surahController = Get.find<SurahController>();

  BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarkController>(
      builder: (ctr) {
        return FutureBuilder<List<Map<String, dynamic>>>(
            future: controller.getBookmark(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                return const Center(child: Text("Tidak ada data"));
              }

              if (snapshot.data!.isEmpty) {
                return const Center(child: Text("Tidak ada data"));
              }

              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  Map<String, dynamic>? bookmark = snapshot.data?[index];
                  return ListTile(
                    onTap: () {},
                    leading: Obx(() => Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      surahController.isDark.isTrue
                                          ? AppConst.imageListDark
                                          : AppConst.imageList))),
                          child: Center(
                              child: Text(
                            "${index + 1}",
                          )),
                        )),
                    title: Text(
                        "${bookmark?['surah'].toString().replaceAll("+", "'")}"),
                    subtitle: Text(
                      "Ayat ${bookmark?['ayat']} - via ${bookmark?['via']}",
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteBookmark(bookmark?['id']);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            });
      },
    );
  }
}
