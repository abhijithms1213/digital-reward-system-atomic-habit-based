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
  late AudioPlayer clickAudioPlayer;
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
    clickAudioPlayer = AudioPlayer()
      ..setAsset(AppAssets.sfxEnterButton)
      ..setClip(start: Duration(milliseconds: 1360), end: Duration(seconds: 2));
    await audioPlayer.setVolume(10);
    await earnAudioPlayer.setVolume(0.6);
    // clickAudioPlayer.setAsset(AppAssets.sfxEnterButton);
    // clickAudioPlayer.setClip(
    //   start: Duration(milliseconds: 1360),
    //   end: Duration(seconds: 2),
    // );
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
      await audioPlayer.setAsset(AppAssets.sfxUpVolumeRise);
      await audioPlayer.setClip(
        start: Duration(milliseconds: 1300),
        end: Duration(seconds: 4),
      );

      // audioPlayer.play();
      // controller.audioPlayer.playerStateStream.listen((state) {
      //   if (state.playing==true) {
      //     log('inside if ');
      //     controller.audioPlayer.play();
      //   }
      // });

      // waits for the timing
      await Future.delayed(Duration(milliseconds: 950));

      // start earn sfx
      await earnAudioPlayer.setAsset(AppAssets.sfxEarn);
      // celebration coffine forward after hit
      var celeTicket = celebrationController.forward();

      // earnAudioPlayer.play();

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
      // await controller.earnAudioPlayer.stop();
      // await controller.audioPlayer.stop();
      // when completed the hit controller
      // hittingHammer.whenComplete(()  {
      // });
    } finally {
      isAnimating.value = false;
      isElevated.value = true;
    }
  }

  click() async {
    clickAudioPlayer.setAsset(AppAssets.sfxEnterButton);
    clickAudioPlayer.setClip(
      start: Duration(milliseconds: 1360),
      end: Duration(seconds: 2),
    );
    var enterClick = clickAudioPlayer.play();
    isElevated.value = false;

    await Future.delayed(const Duration(milliseconds: 220));
    isElevated.value = true;
    enterClick.whenComplete(() {
      clickAudioPlayer.stop();
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    clickAudioPlayer.dispose();
    blackSmithController.dispose();
    trophyController.dispose();
    celebrationController.dispose();
    rippleEffectController.dispose();
    completedController.dispose();
    super.dispose();
  }
}
