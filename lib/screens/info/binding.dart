import 'package:drewardsystem/screens/info/controller.dart';
import 'package:get/get.dart';

class ScreenAboutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScreenAboutController());
  }
}
