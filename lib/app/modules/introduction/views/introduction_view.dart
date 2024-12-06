import '../../../../component/config/app_style.dart';
import '../../../../component/config/app_theme.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Al-Quran Apps",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                "Sesibuk itukah kamu sampai belum membaca alquran ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const Gap(40),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.textSize2Xl),
              child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Lottie.asset("assets/lotties/animasi-quran-3.json")),
            ),
            const Gap(30),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.home),
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Get.isDarkMode ? AppStyle.white : AppStyle.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
              child: Text(
                "Get Started",
                style: TextStyle(
                    color:
                        Get.isDarkMode ? AppStyle.purpleDark : AppStyle.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
