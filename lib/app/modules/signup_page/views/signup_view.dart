import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controllers.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: const Center(child: Text('SignupView (ยังไม่พัฒนา)')),
    );
  }
}
