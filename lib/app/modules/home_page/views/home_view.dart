import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color(0xFF001524),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // หัวข้อ Welcome
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  'Welcome to\nCarbonLens',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFAFA),
                  ),
                ),
              ),

              // รูปภาพป่า
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/bg_forest.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 220,
                ),
              ),

              const SizedBox(height: 16),

              // การ์ด Estimate CO2 and O2
              _buildFeatureCard(
                context,
                title: 'Estimate CO2 and O2',
                descriptionParts: [
                  TextSpan(text: '   วัดปริมาณการดูดซับ '),
                  TextSpan(text: 'คาร์บอน', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '\n'),
                  TextSpan(text: 'ไดออกไซด์', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' และ '),
                  TextSpan(text: 'ออกซิเจน', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' ของต้นไม้'),
                ],
                imagePath: 'assets/images/CO2_home1.png',
                onPressed: () => controller.startDetection(0),
              ),

              // การ์ด Estimate Tree Height
              _buildFeatureCard(
                context,
                title: 'Estimate Tree Height',
                descriptionParts: [
                  TextSpan(text: '   ฟังก์ชันนี้จะประมาณ '),
                  TextSpan(text: 'ความสูง', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '\nต้นไม้ โดยใช้ความสูงที่ผู้ใช้กำหนด'),
                ],
                imagePath: 'assets/images/tree_home2.png',
                onPressed: () => controller.startDetection(1),
              ),

              // การ์ด Estimate Tree Distance
              _buildFeatureCard(
                context,
                title: 'Estimate Tree Distance',
                descriptionParts: [
                  TextSpan(text: '   ฟังก์ชันนี้จะประมาณ '),
                  TextSpan(text: 'ระยะทาง', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '\nระหว่างตำแหน่งที่เล็งโดยเป้าเล็ง'),
                ],
                imagePath: 'assets/images/tree_home3.png',
                onPressed: () => controller.startDetection(2),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),

      // แถบนำทางด้านล่าง
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFAFA),
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavIcon(() => controller.navigateToPage('/home'), 'assets/images/home_icon.png'),
              _buildNavIcon(() => controller.navigateToPage('/camdetect'), 'assets/images/cam_icon.png'),
              _buildNavIcon(() => controller.navigateToPage('/result'), 'assets/images/clock_icon.png'),
              _buildNavIcon(() => controller.navigateToPage('/profile'), 'assets/images/user_icon.png'),
            ],
          ),
        ),
      ),
    );
  }

  // สร้างการ์ดฟีเจอร์แต่ละอัน
  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required List<TextSpan> descriptionParts,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEBF4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ข้อความซ้ายของการ์ด
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF146356),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                    children: descriptionParts,
                  ),
                ),
                const SizedBox(height: 12),

                // ปุ่ม Check Now พร้อมไอคอนด้านหลัง
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF98CD00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: onPressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Check Now',
                        style: TextStyle(
                          fontSize: 11.51,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          color: Color(0xFFFFFAFA),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFFFFAFA),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // ภาพด้านขวาของการ์ด
          Align(
            alignment: title.contains('Height') ? Alignment.center : Alignment.topCenter,
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }

  // ไอคอนใน Navigation Bar
  Widget _buildNavIcon(VoidCallback onTap, String iconPath) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        iconPath,
        width: 30,
        height: 30,
        color: Colors.black,
      ),
    );
  }
}
