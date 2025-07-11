import 'package:get/get.dart';
import '../controllers/signup_controllers.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
