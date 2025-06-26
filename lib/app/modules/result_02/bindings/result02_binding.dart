import 'package:get/get.dart';
import '../controllers/result02_controllers.dart';

class Result02Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Result02Controller>(() => Result02Controller());
  }
}
