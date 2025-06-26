import 'package:get/get.dart';
import '../controllers/result03_controllers.dart';

class Result03Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Result03Controller>(() => Result03Controller());
  }
}
