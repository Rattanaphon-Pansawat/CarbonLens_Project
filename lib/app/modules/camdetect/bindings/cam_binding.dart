import 'package:get/get.dart';

import '../controllers/cam_controller.dart';

class CameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CAMEController>(
      () => CAMEController(),
    );
  }
}
