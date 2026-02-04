import 'dart:developer';

import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:drewardsystem/screens/lottie/model/habit_models.dart';
import 'package:drewardsystem/screens/lottie/repos/hive_operations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class LottieController extends GetxController with GetTickerProviderStateMixin {
  late final AnimationController completedController;
  late final AnimationController celebrationController;
  late final AnimationController rippleEffectController;
  late final AnimationController earnedPointController;

  late AudioPlayer audioPlayer;
  late AudioPlayer earnAudioPlayer;
  final AudioPlayer enterSFXAudioPlayer = AudioPlayer();
  final isAnimating = false.obs;
  final isElevated = true.obs;
  final loading = true.obs;
  final ignoreNextTap = false.obs;

  //habit controllers
  late final AnimationController devHabitController;
  late final AnimationController trophyController;
  late final AnimationController readController;
  late final AnimationController workoutController;
  late final AnimationController meditationController;
  late final AnimationController loadingController;

  final List<Categories> categories = <Categories>[
    Categories(modeName: 'default', lottieResource: AppAssets.trophyLottie),
    Categories(modeName: 'Dev', lottieResource: AppAssets.developerLottie),
    Categories(modeName: 'med', lottieResource: AppAssets.stressLottie),
    Categories(
      modeName: 'workout',
      lottieResource: AppAssets.gymWeightLiftLottie,
    ),
    Categories(modeName: 'reading', lottieResource: AppAssets.readingLottie),
  ].obs;
  final HiveFunctions hiveFunctions = HiveFunctions();
  final Rx<Categories> firstCategories = Categories(
    modeName: '',
    lottieResource: '',
  ).obs;
  

  @override
  void onInit() {
    firstCategories.value = categories[0];
    _audio();
    _animations();
    super.onInit();
  }

  _audio() async {
    audioPlayer = AudioPlayer();
    earnAudioPlayer = AudioPlayer();
    enterSFXAudioPlayer.setAsset(AppAssets.sfxEnterButton);
    enterSFXAudioPlayer.setClip(
      start: Duration(milliseconds: 1380),
      end: Duration(seconds: 2),
    );
    enterSFXAudioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        enterSFXAudioPlayer.pause();
        enterSFXAudioPlayer.seek(Duration.zero);
      }
    });
    audioPlayer.setAsset(AppAssets.sfxUpVolumeRise);
    audioPlayer.setClip(
      start: Duration(milliseconds: 1300),
      end: Duration(seconds: 4),
    );

    // start earn sfx
    await earnAudioPlayer.setAsset(AppAssets.sfxEarn);

    await audioPlayer.setVolume(10);
    await earnAudioPlayer.setVolume(0.6);

    await enterSFXAudioPlayer.setVolume(0.6);
    await audioPlayer.setSpeed(2.4);
  }

  _animations() {
    // isFinished.value = true;
    completedController = AnimationController(vsync: this);
    earnedPointController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    celebrationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  
    loadingController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    trophyController = AnimationController(vsync: this);
    rippleEffectController = AnimationController(vsync: this);

    // habits

    // read
    readController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    // developer
    devHabitController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    // workout
    workoutController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    // meditation
    meditationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
  }

  onTap({bool isSoundNeeded = false, String? mode}) async {
    click(isSoundNeeded: isSoundNeeded);
    if (isAnimating.value) return;
    isAnimating.value = true;
    // controller.celebrationController.addListener();
    try {
      // tapping controller
      rippleEffectController.forward();

      audioPlayer.play();

      // waits for the timing
      await Future.delayed(Duration(milliseconds: 950));

      // celebration coffine forward after hit
      var celeTicket = celebrationController.forward();

      earnAudioPlayer.play();

      await Future.delayed(Duration(milliseconds: 100));

      mode ??= 'default';
      // to forward animation
      heroAnimationForward(mode, true);

      await Future.delayed(Duration(milliseconds: 400), () {
        earnedPointController.forward();
      });

      // when completed the celebration
      await celeTicket.whenComplete(() async {
        celebrationController.reset();
        await Future.delayed(Duration(seconds: 1));
        // resetting after initial effect
        rippleEffectController.reset();
        earnedPointController.reset();

        // to reset

        heroAnimationForward(mode ?? 'default', false);
      });
    } finally {
      audioPlayer.pause();
      audioPlayer.seek(Duration.zero);
      earnAudioPlayer.pause();
      earnAudioPlayer.seek(Duration.zero);
      isAnimating.value = false;
      // isElevated.value = true; //for work on hold
    }
  }

  click({bool isSoundNeeded = false}) async {
    if (isSoundNeeded) handleEnter();
    isElevated.value = false;
    await Future.delayed(const Duration(milliseconds: 220));
    isElevated.value = true;
  }

  void handleEnter() {
    if (enterSFXAudioPlayer.playing) {
      enterSFXAudioPlayer.pause();
      enterSFXAudioPlayer.seek(Duration.zero);
      enterSFXAudioPlayer.play();
    } else {
      enterSFXAudioPlayer.play();
    }
  }

  void heroAnimationForward(String mode, bool isForward) {
    if (isForward) {
      switch (mode) {
        case 'default':
          trophyController.forward();
        case 'Dev':
          devHabitController.forward();
        case 'workout':
          workoutController.forward();
        case 'med':
          meditationController.forward();
        case 'reading':
          readController.forward();
      }
    }
    if (!isForward) {
      log('reset');
      switch (mode) {
        case 'default':
          trophyController.reset();
        case 'Dev':
          devHabitController.reset();
        case 'workout':
          workoutController.reset();
        case 'med':
          meditationController.reset();
        case 'reading':
          readController.reset();
      }
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    enterSFXAudioPlayer.dispose();
    trophyController.dispose();
    celebrationController.dispose();
    rippleEffectController.dispose();
    completedController.dispose();
    readController.dispose();
    meditationController.dispose();
    workoutController.dispose();
    devHabitController.dispose();
    loadingController.dispose();
    super.dispose();
  }
}
