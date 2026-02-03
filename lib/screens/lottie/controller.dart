import 'dart:developer';

import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class LottieController extends GetxController with GetTickerProviderStateMixin {
  late final AnimationController completedController;
  late final AnimationController celebrationController;
  late final AnimationController trophyController;
  late final AnimationController blackSmithController;
  late final AnimationController rippleEffectController;
  late final AnimationController earnedPointController;
  late AudioPlayer audioPlayer;
  late AudioPlayer earnAudioPlayer;
  final AudioPlayer enterSFXAudioPlayer = AudioPlayer();
  final isAnimating = false.obs;
  final isElevated = true.obs;

  @override
  void onInit() {
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
    blackSmithController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    trophyController = AnimationController(vsync: this);
    rippleEffectController = AnimationController(vsync: this);
  }

  onTap() async {
    click();
    if (isAnimating.value) return;
    isAnimating.value = true;
    // controller.celebrationController.addListener();
    try {
      log('tapped ');
      // tapping controller
      blackSmithController.forward();
      rippleEffectController.forward();

      audioPlayer.play();

      // waits for the timing
      await Future.delayed(Duration(milliseconds: 950));

      // celebration coffine forward after hit
      var celeTicket = celebrationController.forward();

      earnAudioPlayer.play();

      await Future.delayed(Duration(milliseconds: 100));
      trophyController.forward();
      await Future.delayed(Duration(milliseconds: 400), () {
        earnedPointController.forward();
      });

      // when completed the celebration
      await celeTicket.whenComplete(() async {
        celebrationController.reset();
        await Future.delayed(Duration(seconds: 1));
        trophyController.reset();
        // resetting after initial effect
        rippleEffectController.reset();
        blackSmithController.reset();
        earnedPointController.reset();
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

  click() async {
    handleEnter();
    isElevated.value = false;

    await Future.delayed(const Duration(milliseconds: 220));
    isElevated.value = true;
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    enterSFXAudioPlayer.dispose();
    blackSmithController.dispose();
    trophyController.dispose();
    celebrationController.dispose();
    rippleEffectController.dispose();
    completedController.dispose();
    super.dispose();
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
}
