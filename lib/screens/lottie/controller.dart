import 'dart:async';
import 'dart:developer';

import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:drewardsystem/screens/lottie/model/habit_models.dart';
import 'package:drewardsystem/screens/lottie/repos/hive_operations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class LottieController extends GetxController with GetTickerProviderStateMixin {
  // mini tasks
  late final AnimationController firstController;
  late final AnimationController secondController;
  late final AnimationController thirdController;
  late final AnimationController fourthController;
  late final AnimationController heroController;
  late final AnimationController heroReplacerController;
  final RxInt miniTaskCurrentValue = 0.obs;
  late AudioPlayer miniTaskearn;
  late AudioPlayer miniTaskTap;

  //normal
  late final AnimationController completedController;
  late final AnimationController celebrationController;
  late final AnimationController rippleEffectController;
  late final AnimationController confettiForNormalClickController;
  late final AnimationController earnedPointController;

  late AudioPlayer audioPlayer;
  late AudioPlayer earnAudioPlayer;
  final AudioPlayer enterSFXAudioPlayer = AudioPlayer();
  final isAnimating = false.obs;
  final isElevated = true.obs;
  final loading = false.obs;
  final isProcessing = false.obs;
  final ignoreNextTap = false.obs;

  //habit controllers
  late final AnimationController devHabitController;
  late final AnimationController trophyController;
  late final AnimationController readController;
  late final AnimationController workoutController;
  late final AnimationController meditationController;
  late final AnimationController morningController;
  late final AnimationController nightController;
  late final AnimationController gymLoadingBasedController;

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
    Categories(modeName: 'morning', lottieResource: AppAssets.readingLottie),
    Categories(modeName: 'night', lottieResource: AppAssets.nightLottie),
    Categories(modeName: 'mini 01', lottieResource: AppAssets.nightLottie),
    Categories(modeName: 'mini 02', lottieResource: AppAssets.nightLottie),
    Categories(modeName: 'mini 03', lottieResource: AppAssets.nightLottie),
    // Categories(modeName: 'workout full', lottieResource: AppAssets.nightLottie),
  ].obs;
  final HiveFunctions hiveFunctions = HiveFunctions();
  final Rx<Categories> firstCategories = Categories(
    modeName: '',
    lottieResource: '',
  ).obs;

  Timer? timerCancelTap;
  Timer? timerForHold;

  @override
  void onInit() {
    firstCategories.value = categories[0];
    _audio();
    _animations();
    _listeningFunction();
    super.onInit();
  }

  bool isCanceling = false;
  cancelTapOnRelease() {
    isCanceling = false;

    timerCancelTap?.cancel();
    // await Future.delayed(const Duration(milliseconds: 220));
    timerCancelTap = Timer(Duration(milliseconds: 20), () {
      isElevated.value = true;
      isCanceling = true;
      log('canceled');
    });
  }

  _audio() async {
    audioPlayer = AudioPlayer();
    earnAudioPlayer = AudioPlayer();
    miniTaskearn = AudioPlayer();
    miniTaskTap = AudioPlayer();

   await miniTaskTap.setAsset(AppAssets.sfxMiniEnterForMiniTasks);
   await miniTaskearn.setAsset(AppAssets.sfxMiniEarnSound);

   await enterSFXAudioPlayer.setAsset(AppAssets.sfxEnterButton);
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
   await audioPlayer.setAsset(AppAssets.sfxUpVolumeRise);
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
    confettiForNormalClickController = AnimationController(vsync: this);
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
      duration: Duration(seconds: 2),
    );
    trophyController = AnimationController(vsync: this);
    rippleEffectController = AnimationController(vsync: this);

    // habits

    // night
    nightController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    // morning
    morningController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    // read
    readController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
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
    // Gym full
    gymLoadingBasedController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      lowerBound: 0,
      upperBound: 1,
    );

    // mini task
    firstController = AnimationController(vsync: this);

    // animation=Tween<double>(begin: 0,end: .9).animate(firstController);
    secondController = AnimationController(
      vsync: this,
      // duration: Duration(milliseconds: 8000),
    );
    thirdController = AnimationController(
      vsync: this,
      // duration: Duration(seconds: 2),
    );
    fourthController = AnimationController(
      vsync: this,
      // duration: Duration(seconds: 2),
    );
    heroController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    heroReplacerController = AnimationController(
      vsync: this,
      // duration: Duration(seconds: 2),
    );
  }

  _listeningFunction() {
    firstController.addListener(() {
      if (firstController.value >= 0.8) {
        firstController.stop();
      }
    });
    secondController.addListener(() {
      if (secondController.value >= 0.8) {
        secondController.stop();
      }
    });
    thirdController.addListener(() {
      if (thirdController.value >= 0.8) {
        thirdController.stop();
      }
    });
    fourthController.addListener(() {
      if (fourthController.value >= 0.8) {
        fourthController.stop();
      }
    });
    heroController.addListener(() {
      if (heroController.value >= 0.8) {
        heroController.stop();
      }
    });
  }

  onTap({bool isSoundNeeded = false, String? mode}) async {
    isProcessing.value = true;
    click(isSoundNeeded: isSoundNeeded);
    if (isAnimating.value) return;
    isAnimating.value = true;
    // controller.celebrationController.addListener();
    try {
      // tapping controller
      rippleEffectController.forward(); // tapping effect confetti

      audioPlayer.play();

      // waits for the timing
      await Future.delayed(Duration(milliseconds: 950));

      if (mode == 'reading') readController.forward();
      // celebration coffine forward after hit
      var celeTicket = celebrationController.forward();

      earnAudioPlayer.play();

      await Future.delayed(Duration(milliseconds: 100));

      mode ??= 'default';
      // to forward animation
      if (mode != 'reading') heroAnimationForward(mode, true);

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
      isProcessing.value = false;
      // isElevated.value = true; //for work on hold
    }
  }

  miniTasks(int index) async {
    isProcessing.value = true;
    miniTaskTap.setClip(
      start: Duration(milliseconds: 50),
      // end: Duration(seconds: 2),
    );
    click(isSoundNeeded: true, isMini: true);
    isAnimating.value = true;
    TickerFuture tickerFuture;
    try {
      if (index == 1) {
        tickerFuture = firstController.forward();
      } else if (index == 2) {
        tickerFuture = secondController.forward();
      } else if (index == 3) {
        tickerFuture = thirdController.forward();
      } else if (index == 4) {
        tickerFuture = fourthController.forward();
      } else if (index == 5) {
        tickerFuture = heroController.forward();
        celebrationController.forward();
      }
      await Future.delayed(Duration(milliseconds: 800));
      if (index <= 5 && index >= 0) {
        if (miniTaskearn.playing) {
          miniTaskearn.pause();
          miniTaskearn.seek(Duration.zero);
          miniTaskearn.play();
        } else {
          miniTaskearn.play();
        }
      }
      if (index >= 6) {
        firstController.reset();
        secondController.reset();
        thirdController.reset();
        fourthController.reset();
        heroController.reset();
        heroReplacerController.reset();
        miniTaskCurrentValue.value = 0;
        if (celebrationController.isCompleted || index >= 6) {
          celebrationController.reset();
        }
      }
    } finally {
      isAnimating.value = false;
      isProcessing.value = false;
    }
  }

  click({bool isSoundNeeded = false, bool isMini = false}) async {
    if (isSoundNeeded) handleEnter(isMini);
    confettiForNormalClickController
      ..stop()
      ..reset()
      ..forward();
    isElevated.value = false;
    await Future.delayed(const Duration(milliseconds: 220));
    isElevated.value = true;
  }

  void handleEnter(bool isMini) {
    if (isMini) {
      handleMiniEnter();
    } else {
      if (enterSFXAudioPlayer.playing) {
        enterSFXAudioPlayer.pause();
        enterSFXAudioPlayer.seek(Duration.zero);
        enterSFXAudioPlayer.play();
      } else {
        enterSFXAudioPlayer.play();
      }
    }
  }

  void handleMiniEnter() {
    if (miniTaskTap.playing) {
      miniTaskTap.pause();
      miniTaskTap.seek(Duration.zero);
      miniTaskTap.play();
    } else {
      miniTaskTap.play();
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
        case 'night':
          nightController.forward();
        case 'morning':
          morningController.forward();
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
        case 'morning':
          morningController.reset();
        case 'night':
          nightController.reset();
      }
    }
  }

  void gymspecificAnimationHold() {
    timerForHold?.cancel();
    // bool getCancelVal=cancelTapOnRelease();
    // if (getCancelVal) {
    //   return;
    // }
    timerForHold = Timer.periodic(Duration(milliseconds: 16), (_) {
      if (gymLoadingBasedController.value < 1) {
        gymLoadingBasedController.value += .025;
      } else {
        gymLoadingBasedController.value = 1;
        timerForHold?.cancel();
        log('horraaayyy');
      }
    });
  }

  void gymspecificAnimationRelease() {
    timerForHold?.cancel();

    timerForHold = Timer.periodic(Duration(milliseconds: 16), (_) {
      if (gymLoadingBasedController.value > 0) {
        gymLoadingBasedController.value -= .0020;
      } else {
        gymLoadingBasedController.value = 0;
        timerForHold?.cancel();
        log('from gym release');
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    enterSFXAudioPlayer.dispose();
    miniTaskTap.dispose();
    miniTaskearn.dispose();
    trophyController.dispose();
    celebrationController.dispose();
    rippleEffectController.dispose();
    completedController.dispose();
    readController.dispose();
    meditationController.dispose();
    workoutController.dispose();
    devHabitController.dispose();
    loadingController.dispose();
    confettiForNormalClickController.dispose();
    morningController.dispose();
    nightController.dispose();
    //mini task
    firstController.dispose();
    secondController.dispose();
    fourthController.dispose();
    thirdController.dispose();
    heroController.dispose();
    heroReplacerController.dispose();
    gymLoadingBasedController.dispose();
    super.dispose();
  }
}
