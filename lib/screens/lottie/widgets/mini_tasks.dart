import 'dart:developer';

import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:drewardsystem/screens/lottie/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WidgetMiniTasks extends StatelessWidget {
  WidgetMiniTasks({super.key, required this.lottieFile});
  final String lottieFile;
  final LottieController controller = Get.find<LottieController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color.fromARGB(19, 0, 0, 0),
              ),
              width: 80,
              height: 80,
              child: Lottie.asset(
                lottieFile,
                controller: controller.firstController,

                onLoaded: (compositor) {
                  controller.firstController.duration = compositor.duration;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color.fromARGB(19, 0, 0, 0),
              ),
              width: 80,
              height: 80,
              child: Lottie.asset(
                lottieFile,
                controller: controller.secondController,

                onLoaded: (compositor) {
                  controller.secondController.duration = compositor.duration;
                },
                width: 80,
                height: 80,
              ),
            ),
            Container(
              // color: Colors.yellow,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color.fromARGB(19, 0, 0, 0),
              ),
              width: 80,
              height: 80,
              child: Lottie.asset(
                lottieFile,
                controller: controller.thirdController,
                onLoaded: (p0) {
                  controller.thirdController.duration = p0.duration;
                },
                width: 80,
                height: 80,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color.fromARGB(19, 0, 0, 0),
              ),
              width: 80,
              height: 80,
              child: Lottie.asset(
                lottieFile,
                controller: controller.fourthController,
                onLoaded: (p0) {
                  controller.fourthController.duration = p0.duration;
                },
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(() {
          if (controller.miniTaskCurrentValue.value <= 4) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                // color: const Color.fromARGB(8, 0, 0, 0),
              ),
              child: Lottie.asset(
                AppAssets.aimHitLottie,
                controller: controller.heroController,
                onLoaded: (p0) {
                  controller.heroController.duration = p0.duration;
                },
                width: 200,
                height: 200,
                fit: BoxFit.cover
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              // color: const Color.fromARGB(8, 0, 0, 0),
            ),
            child: Lottie.asset(
              lottieFile,
              controller: controller.heroController,
              onLoaded: (p0) {
                controller.heroController.duration = p0.duration;
              },
              width: 200,
              height: 200,
            ),
          );
        }),
      ],
    );
  }
}
