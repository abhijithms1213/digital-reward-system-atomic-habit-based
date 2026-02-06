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
                  if (lottieFile == AppAssets.success02Lottie) {
                    controller.firstController.duration = Duration(
                      milliseconds: 900,
                    );
                  } else {
                    controller.firstController.duration = compositor.duration;
                  }
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
                  if (lottieFile == AppAssets.success02Lottie) {
                    controller.secondController.duration = Duration(
                      milliseconds: 900,
                    );
                  } else {
                    controller.secondController.duration = compositor.duration;
                  }
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
                onLoaded: (compositor) {
                  if (lottieFile == AppAssets.success02Lottie) {
                    controller.thirdController.duration = Duration(
                      milliseconds: 900,
                    );
                  } else {
                    controller.thirdController.duration = compositor.duration;
                  }
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
                onLoaded: (compositor) {
                  if (lottieFile == AppAssets.success02Lottie) {
                    controller.fourthController.duration = Duration(
                      milliseconds: 900,
                    );
                  } else {
                    controller.fourthController.duration = compositor.duration;
                  }
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
                AppAssets.arrowHitLottie,
                controller: controller.heroReplacerController,
                onLoaded: (p0) {
                  controller.heroReplacerController.duration = p0.duration;
                },
                width: 200,
                height: 200,
                fit: BoxFit.cover,
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
              // onLoaded: (compositor) {
              //   // if (lottieFile == AppAssets.success02Lottie) {
              //   //   controller.heroController.duration = Duration(
              //   //     milliseconds: 800,
              //   //   );
              //   // } else {
              //     controller.heroController.duration = compositor.duration;
              //   // }
              // },
              frameRate: FrameRate(120),
              width: 200,
              height: 200,
            ),
          );
        }),
      ],
    );
  }
}
