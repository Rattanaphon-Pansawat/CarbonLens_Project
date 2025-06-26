import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/signup_controllers.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001524),
      body: SafeArea(
        child: Stack(
          children: [

            // 📌 โลโก้มุมขวาบน
            Positioned(
              top: 18,
              right: 18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/carbonlens_logo.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  // 🔙 ปุ่ม back (SVG)
                  GestureDetector(
                    onTap: controller.handleBack, // 👈 ใช้ controller
                    child: SvgPicture.asset(
                      'assets/icons/back_arrow.svg',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Sign Up
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFAFA),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🐸 ภาพกบ
                  Center(
                    child: Image.asset(
                      'assets/images/Hi_frog.png',
                      height: 270,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text('ไม่พบภาพกบ', style: TextStyle(color: Colors.red));
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Username
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFAFA),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    height: 58,
                    child: TextField(
                      controller: controller.usernameController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 📧 Email
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFAFA),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    height: 58,
                    child: TextField(
                      controller: controller.usernameController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔒 Password
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFAFA),
                      borderRadius: BorderRadius.circular(29),
                    ),
                    height: 58,
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/homepage');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF146356),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFAFA),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
