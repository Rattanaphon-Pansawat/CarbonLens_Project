import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final name = ''.obs;
  final password = ''.obs;

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
