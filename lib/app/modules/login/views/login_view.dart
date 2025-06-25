import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:carbonlens_app_01/app/widgets/input_text.dart'; 
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final labelStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Color(0xFF658147), // สีเขียวเข้ม
    );

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF658147),
      body: SafeArea(
        child: Stack(
          children: [

            // เนื้อหาด้านบนทั้งหมด (ข้อความ "สวัสดี!" กับข้อความต้อนรับ)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 32),
                  Text(
                    'สวัสดี!',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF4F9F4),
                    ),
                  ),
                  
                  SizedBox(height: 8),
                  Text(
                    'ยินดีต้อนรับ เข้าสู่ คาร์บอนเลนส์\nแอพพลิเคชันคำนวณปริมาณการดูดซับ\nคาร์บอนไดออกไซด์ ของต้นไม้',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFF4F9F4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // กล่อง Login 
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.zero, // ชิดซ้าย-ขวาสุดจอ
                child: Container(
                  constraints: BoxConstraints(
                  minHeight: screenHeight * 0.6, // ยืดกล่องให้สูงขึ้นตามขนาดหน้าจอ
                  ),
                  padding: const EdgeInsets.all(24), // ระยะขอบในกล่อง

                  decoration: const BoxDecoration(
                    color: Color(0xFFF4F9F4), // สีเขียวขาว
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D4C28),
                        ),
                      ),
                      const SizedBox(height: 16),

                      myInput(
                        label: 'ชื่อผู้ใช้งาน',
                        controllerValue: controller.name,
                        hintText: 'กรอกชื่อผู้ใช้งาน',
                        labelStyle: labelStyle,
                      ),

                      myInput(
                        label: 'รหัสผ่าน',
                        controllerValue: controller.password,
                        hintText: 'กรอกรหัสผ่าน',
                        labelStyle: labelStyle,
                      ),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // ฟังก์ชันลืมรหัสผ่าน
                          },
                          child: const Text(
                            'ลืมรหัสผ่าน ?',
                            style: TextStyle(color: Color(0xFF658147)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      ElevatedButton(
                        onPressed: () => Get.toNamed('/homepage'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF658147),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // โลโก้ fix กึ่งกลางแนวตั้ง ระหว่างสีเขียวกับกล่อง Login
            Positioned(
              top: (screenHeight / 2) - (204 / 2) - 20,
              right: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/carbonlens_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
