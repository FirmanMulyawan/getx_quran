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
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Gap(10),
            SizedBox(
                width: 300,
                height: 300,
                child: Lottie.asset("assets/lotties/animasi-quran.json")),
            const Gap(30),
            ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.home),
                child: const Text("Get Started"))
          ],
        ),
      ),
    );
  }
}
