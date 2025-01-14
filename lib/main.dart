import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'component/config/app_theme.dart';

void main() async {
  await GetStorage.init();

  final box = GetStorage();

  runApp(
    GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: box.read("themeDark") == null
          ? AppTheme.themeLight
          : AppTheme.themeDark,
      title: "Application",
      initialRoute: Routes.introduction,
      getPages: AppPages.routes,
    ),
  );
}
