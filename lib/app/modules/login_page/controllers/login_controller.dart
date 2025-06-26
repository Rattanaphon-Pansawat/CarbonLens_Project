import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final name = ''.obs;
  final password = ''.obs;

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  /// 👉 จัดการเมื่อผู้ใช้กดปุ่ม Back
  void handleBack() {
    // เช่น: เคลียร์ข้อมูลก่อนกลับ
    nameController.clear();
    passwordController.clear();

    // กลับไปหน้าเดิม
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
