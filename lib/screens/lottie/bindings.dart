import 'package:drewardsystem/screens/lottie/controller.dart';
import 'package:get/get.dart';

class LottieBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LottieController());
  }
}
