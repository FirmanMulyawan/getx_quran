import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../component/config/app_style.dart';
import '../../../../data/db/bookmark.dart';

class BookmarkController extends GetxController {
  DatabaseManager database = DatabaseManager.instance;

  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    List<Map<String, dynamic>> allBookmark =
        await db.query("bookmark", where: "last_read == 0");

    return allBookmark;
  }

  void deleteBookmark(int id) async {
    Database db = await database.db;
    await db.delete("bookmark", where: "id=$id");
    update();
    Get.snackbar("Berhasil", "Telah berhasil menghapus bookmark",
        colorText: AppStyle.white);
  }
}
