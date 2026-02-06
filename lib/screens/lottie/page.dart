import 'dart:developer';
import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:drewardsystem/screens/lottie/controller.dart';
import 'package:drewardsystem/screens/lottie/model/habit_models.dart';
import 'package:drewardsystem/screens/lottie/widgets/mini_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends GetView<LottieController> {
  LottiePage({super.key});
  final bgColor = Color.fromARGB(255, 255, 255, 255);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            //troffy center
            Obx(() {
              if (controller.loading.value) {
                return Center(
                  child: Lottie.asset(
                    AppAssets.sandyLoadingLottie,
                    controller: controller.loadingController,
                    width: 200,
                    height: 200,
                  ),
                );
              }
              if (controller.firstCategories.value.modeName == 'mini 01') {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  top: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        // color: Colors.red.withOpacity(0.5),
                        child: WidgetMiniTasks(
                          lottieFile: AppAssets.success01Lottie,
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (controller.firstCategories.value.modeName == 'mini 02') {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  top: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        // color: Colors.red.withOpacity(0.5),
                        child: WidgetMiniTasks(
                          lottieFile: AppAssets.success02Lottie,
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (controller.firstCategories.value.modeName == 'mini 03') {
                return Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  top: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 300,
                        // color: Colors.red.withOpacity(0.5),
                        child: WidgetMiniTasks(
                          lottieFile: AppAssets.success03Lottie,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Positioned(
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
                      // if (controller.loading.value) {
                      //   return Lottie.asset(
                      //     AppAssets.sandyLoadingLottie,
                      //     controller: controller.loadingController,
                      //     width: 200,
                      //     height: 200,
                      //   );
                      // }
                      switch (mode) {
                        case 'night':
                          return Lottie.asset(
                            AppAssets.aimHitLottie,
                            frameRate: FrameRate(120),
                            controller: controller.nightController,
                            width: 350,
                            height: 350,
                          );
                        case 'workout full':
                          return Lottie.asset(
                            AppAssets.gymLoadingBasedLottie,
                            frameRate: FrameRate(120),
                            controller: controller.gymLoadingBasedController,
                            width: 350,
                            height: 350,
                          );
                        case 'morning':
                          return Lottie.asset(
                            AppAssets.coffeeMorningLottie,
                            controller: controller.morningController,

                            width: 250,
                            height: 250,
                          );
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
                            width: 330,
                            height: 330,
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
              );
              // return SizedBox.shrink();
            }),

            // if (controller.firstCategories.value.modeName != 'mini 01')
            Positioned(
              bottom: -220,
              left: 0,
              right: 0,
              child: Container(
                // color: Colors.red,
                child: Lottie.asset(
                  AppAssets.flextConfettiLottie,
                  controller: controller.confettiForNormalClickController,
                  onLoaded: (p0) {
                    controller.confettiForNormalClickController.duration =
                        p0.duration;
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                ),
              ),
            ),
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
            // blacksmith tapping widget  tapping widget
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

            // button overlay
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (controller.firstCategories.value.modeName ==
                  //     'workout full')
                  //   GestureDetector(
                  //     onTapDown: controller.loading.value
                  //         ? null
                  //         : (_) {
                  //             // controller.isElevated.value = false;
                  //             debugPrint('onTapDown or release');
                  //             if (controller.firstCategories.value.modeName ==
                  //                 'workout full') {
                  //               controller.gymspecificAnimationHold();
                  //             }
                  //           },
                  //     onTapUp: (_) async {
                  //       if (controller.firstCategories.value.modeName ==
                  //           'workout full') {
                  //         // await Future.delayed(Duration(milliseconds: 100));

                  //         controller.gymspecificAnimationRelease();
                  //       }
                  //       // controller.cancelTapOnRelease();
                  //       debugPrint('onTapUp');
                  //       controller.isElevated.value = true;
                  //     },
                  //     onTapCancel: () {
                  //       controller.isElevated.value = true;
                  //       // controller.gymspecificAnimationRelease();
                  //     },
                  //     onTap: controller.isAnimating.value ? null : () {},
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         // color: Colors.red,
                  //         shape: BoxShape.rectangle,
                  //       ),
                  //       height: 100,
                  //       width: 200,
                  //       child: Text(''),
                  //     ),
                  //   ),
                  GestureDetector(
                    onTapDown: controller.loading.value
                        ? null
                        : (_) {
                            controller.isElevated.value = false;
                            debugPrint('onTapDown or release');
                          },
                    onTapUp: (_) async {
                      // controller.cancelTapOnRelease();
                      debugPrint('onTapUp');
                      controller.isElevated.value = true;
                    },
                    onTapCancel: () {
                      controller.isElevated.value = true;
                      // controller.gymspecificAnimationRelease();
                    },
                    onTap: controller.isAnimating.value
                        ? null
                        : () {
                            final String category =
                                controller.firstCategories.value.modeName;

                            if (controller.loading.value == false &&
                                category != 'mini 01' &&
                                category != 'mini 02' &&
                                category != 'mini 03' &&
                                category != 'workout full') {
                              controller.onTap(
                                isSoundNeeded: true,
                                mode: category,
                              );
                            } else if (controller.loading.value == false &&
                                category == 'workout full') {
                              // controller.isElevated.value = true;
                            } else if (controller.loading.value == false) {
                              var current =
                                  controller.miniTaskCurrentValue.value =
                                      controller.miniTaskCurrentValue.value + 1;
                              controller.miniTasks(current);
                              if (controller.miniTaskCurrentValue.value <= 4 &&
                                  controller.miniTaskCurrentValue.value > 0) {
                                controller.heroReplacerController
                                  ..stop()
                                  ..reset()
                                  ..forward();
                              }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() {
                    return SizedBox(
                      width: 70,
                      height: 35,
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          color: Colors.black.withOpacity(.04),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              style: BorderStyle.solid,
                              color: bgColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                        child:
                            // Obx(() {
                            //   return
                            DropdownButton(
                              value: controller.firstCategories.value,
                              dropdownColor: const Color(0xFFF9FAFB),
                              isExpanded: true,
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              underline: const SizedBox(),
                              icon: const SizedBox.shrink(),

                              // Elevated border radius and shadow
                              elevation: 8,
                              borderRadius: BorderRadius.circular(12),

                              // Custom menu styling
                              menuMaxHeight: 300,

                              // Add padding to the dropdown menu
                              selectedItemBuilder: (BuildContext context) {
                                return controller.categories.map((category) {
                                  return Center(
                                    child: Text(
                                      category.modeName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight:
                                            controller.isProcessing.value
                                            ? FontWeight.w400
                                            : FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },

                              items: controller.categories.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: bgColor,
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        category.modeName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight:
                                              controller.isProcessing.value
                                              ? FontWeight.w400
                                              : FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),

                              onChanged: controller.isProcessing.value
                                  ? null
                                  : (Categories? value) async {
                                      controller.loading.value = true;
                                      if (value != null) {
                                        controller.firstCategories.value =
                                            value;
                                      }
                                      await controller.loadingController
                                          .forward(from: .4);
                                      controller.loading.value = false;
                                      controller.loadingController.reset();
                                      log(
                                        'ct${controller.miniTaskCurrentValue.value}',
                                      );
                                      if (controller
                                              .miniTaskCurrentValue
                                              .value !=
                                          0) {
                                        controller.miniTaskCurrentValue.value =
                                            0;
                                        controller.firstController.reset();
                                        controller.secondController.reset();
                                        controller.thirdController.reset();
                                        controller.fourthController.reset();
                                        controller.heroController.reset();
                                        log(
                                          'ct${controller.miniTaskCurrentValue.value}',
                                        );
                                      }
                                    },
                              // );}
                            ),
                      ),
                    );
                  }),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/about'),
                      child: Icon(
                        Icons.chevron_left_sharp,
                        color: const Color.fromARGB(83, 0, 0, 0),
                      ),
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
