import 'dart:developer';

import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:drewardsystem/screens/lottie/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends GetView<LottieController> {
  LottiePage({super.key});
  final bgColor = Color(0xFFE7ECEF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: -300,
              left: 0,
              right: 0,
              child: Lottie.asset(
                AppAssets.tapEffectLottie,
                controller: controller.rippleEffectController,
                onLoaded: (p0) {
                  controller.rippleEffectController.duration = p0.duration;
                },
                width: MediaQuery.of(context).size.width,
                height: 700,
              ),
            ),
            // blacksmith tapping widget
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: bgColor,
                        boxShadow: controller.isElevated.value
                            ? [
                                BoxShadow(
                                  blurRadius: 30,
                                  offset: Offset(-28, -28),
                                  color: Colors.white,
                                ),
                                BoxShadow(
                                  blurRadius: 30,
                                  offset: Offset(28, 28),
                                  color: Colors.black45,
                                ),
                              ]
                            : null,
                      ),
                      duration: Duration(milliseconds: 100),
                      child: SizedBox(height: 100, width: 200),
                    );
                  }),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 20,
            //   left: 0,
            //   right: 0,
            //   // left: 00,
            //   // right: 0,
            //   // bottom: 00,
            //   // top: 0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Lottie.asset(
            //         AppAssets.hammerLottie,
            //         height: 200,
            //         width: 200,
            //         controller: controller.blackSmithController,
            //         frameRate: FrameRate(120),
            //         // onLoaded: (composition) {
            //         //   controller.blackSmithController.duration =
            //         //       composition.duration;
            //         // },
            //       ),
            //     ],
            //   ),
            // ),
            // celebration lottie confetti
            Positioned(
              left: 00,
              right: 0,
              bottom: 00,
              top: 0,
              child: LottieBuilder.asset(
                AppAssets.confettiLottie,
                frameRate: FrameRate(60),
                controller: controller.celebrationController,
                onLoaded: (composition) {
                  // _celebrationController.duration = composition.duration;
                },
                width: 250,
                height: 250,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),

            //earnedPoint center
            Positioned(
              left: 0,
              right: 0,
              top: 100,
              child: Container(
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      AppAssets.pointEarnLottie,
                      controller: controller.earnedPointController,

                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ), //troffy center
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppAssets.trophyLottie,
                    controller: controller.trophyController,
                    onLoaded: (composition) {
                      controller.trophyController.duration =
                          composition.duration;
                    },
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // button overlay
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTapDown: (_) {
                      controller.isElevated.value = false;
                      debugPrint('Yellow onTapCancel');
                    },
                    onTapUp: (_) {
                      debugPrint('Green onTapCancel');
                      controller.isElevated.value = true;
                    },
                    onTap: controller.isAnimating.value
                        ? null
                        : () {
                            controller.onTap();
                          },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        shape: BoxShape.rectangle,
                      ),
                      height: 100,
                      width: 200,
                      child: Text(''),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
