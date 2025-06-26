import 'package:get/get.dart';
import '../controllers/result01_controllers.dart';

class Result01Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Result01Controller>(() => Result01Controller());
  }
}
