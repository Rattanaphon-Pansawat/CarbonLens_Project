import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controllers.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('ProfileView (ยังไม่พัฒนา)')),
    );
  }
}
