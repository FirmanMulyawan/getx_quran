import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'component/config/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      title: "Application",
      initialRoute: Routes.introduction,
      getPages: AppPages.routes,
    ),
  );
}
