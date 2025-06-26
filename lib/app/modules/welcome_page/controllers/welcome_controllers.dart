import 'package:get/get.dart';
import '../../../routes/app_pages.dart'; // เพิ่ม import เส้นทางของ Routes

class WelcomeController extends GetxController {
  void goToLogin() {
    Get.toNamed(Routes.LOGIN);
  }

  void goToSignUp() {
    Get.toNamed(Routes.SIGNUP);
  }
}
