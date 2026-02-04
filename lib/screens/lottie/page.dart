import 'dart:developer';
import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:drewardsystem/screens/lottie/controller.dart';
import 'package:drewardsystem/screens/lottie/model/habit_models.dart';
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
            // celebration lottie confetti trophy
            Positioned(
              left: 00,
              right: 0,
              bottom: 00,
              top: 0,
              child: LottieBuilder.asset(
                AppAssets.confettiLottie,
                frameRate: FrameRate(60),
                controller: controller.celebrationController,
                onLoaded: (composition) {},
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
            ),
            //troffy center
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    final mode = controller.firstCategories.value.modeName;
                    if (controller.loading.value) {
                      return Lottie.asset(
                        // 'assets/lottie/Water splash effect.json',
                        AppAssets.pointEarnLottie,
                        controller: controller.loadingController,
                        width: 250,
                        height: 250,
                      );
                    }
                    switch (mode) {
                      case 'Dev':
                        return Lottie.asset(
                          AppAssets.developerLottie,
                          controller: controller.devHabitController,
                          width: 250,
                          height: 250,
                        );

                      case 'reading':
                        return Lottie.asset(
                          AppAssets.readingLottie,
                          controller: controller.readController,
                          width: 250,
                          height: 250,
                        );
                      case 'workout':
                        return Lottie.asset(
                          AppAssets.gymWeightLiftLottie,
                          controller: controller.workoutController,
                          width: 250,
                          height: 250,
                        );
                      case 'med':
                        return Lottie.asset(
                          AppAssets.stressLottie,
                          controller: controller.meditationController,
                          width: 250,
                          height: 250,
                        );

                      default:
                        return Lottie.asset(
                          AppAssets.trophyLottie,
                          controller: controller.trophyController,
                          onLoaded: (compositor) {
                            controller.trophyController.duration =
                                compositor.duration;
                          },
                          width: 200,
                          height: 200,
                        );
                    }
                  }),
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
                    onTapCancel: () {
                      controller.isElevated.value = true;
                    },
                    onTap: controller.isAnimating.value
                        ? null
                        : () {
                            final String category =
                                controller.firstCategories.value.modeName;
                            if (category == 'default') {
                              controller.onTap(
                                isSoundNeeded: true,
                                mode: category,
                              );
                            } else if (category == 'reading') {
                              controller.onTap(
                                isSoundNeeded: true,
                                mode: category,
                              );
                            } else if (category == 'workout') {
                              controller.onTap(
                                isSoundNeeded: true,
                                mode: category,
                              );
                            } else if (category == 'med') {
                              controller.onTap(
                                isSoundNeeded: true,
                                mode: category,
                              );
                            } else if (category == 'Dev') {
                              controller.onTap(
                                isSoundNeeded: true,
                                mode: category,
                              );
                            }
                            log(category);
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
            Positioned(
              top: 10,
              right: 10,
              // right: 0,
              child: Obx(() {
                return SizedBox(
                  width: 70,
                  height: 35,
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: Colors.black.withOpacity(.05),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid,
                          color: bgColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                    child: DropdownButton<Categories>(
                      value: controller.firstCategories.value,

                      isExpanded: true,
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      // remove underline
                      underline: const SizedBox(),
                      // hide dropdown icon
                      icon: const SizedBox.shrink(),
                      items: controller.categories
                          .map(
                            (category) => DropdownMenuItem<Categories>(
                              value: category,
                              child: Center(
                                child: Text(
                                  category.modeName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    // color: Colors.black54
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),

                      onChanged: (Categories? value) async {
                        controller.loadingController.forward();
                        controller.loading.value = true;
                        if (value != null) {
                          controller.firstCategories.value = value;
                        }
                        await Future.delayed(Duration(seconds: 1));
                        controller.loading.value = false;
                        controller.loadingController.reset();
                      },
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
