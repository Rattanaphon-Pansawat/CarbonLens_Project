import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF658147),
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'หน้าหลัก',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ข้อความต้อนรับ
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: const Text(
                'ยินดีต้อนรับสู่แอพพลิเคชั่นคาร์บอนเลนส์\n'
                'เครื่องมือช่วยคุณวิเคราะห์และติดตามปริมาณ\n'
                'คาร์บอนไดออกไซด์ เลือกหัวข้อที่คุณอยากคำนวณ\n'
                'แล้วเริ่มกันเลย!',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // สร้าง card จาก controller.features
            for (int i = 0; i < controller.features.length; i++)
              Container(
                color: _getBackgroundColor(i),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 50,
                          color: Colors.white,
                          child: Image.network(
                            controller.backgroundImages[i],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            controller.features[i]['description']!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            controller.features[i]['route']!,
                          );
                        },
                        child: Text(
                          controller.features[i]['title']!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF658147),
        selectedItemColor: const Color(0xFF658147),
        unselectedItemColor: const Color.fromARGB(179, 59, 51, 51),
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/camedetect');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/history');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // กำหนดสีพื้นหลังแต่ละกล่องตามลำดับ
  Color _getBackgroundColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFF74B49B);
      case 1:
        return const Color(0xFFA7D7C5);
      case 2:
        return const Color(0xFF5C8D89);
      default:
        return Colors.grey.shade300;
    }
  }
}
