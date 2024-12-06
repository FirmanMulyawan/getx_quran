import '../../../../component/config/app_style.dart';
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
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppStyle.purple),
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
            const Gap(10),
            SizedBox(
                width: 300,
                height: 300,
                child: Lottie.asset("assets/lotties/animasi-quran-3.json")),
            const Gap(30),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.home),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppStyle.purple),
              child: const Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
