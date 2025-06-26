import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final username = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// 👉 จัดการเมื่อผู้ใช้กดปุ่ม Back
  void handleBack() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();

    Get.back();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
