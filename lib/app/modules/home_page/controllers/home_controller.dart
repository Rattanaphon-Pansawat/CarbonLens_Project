import 'package:get/get.dart';

class HomeController extends GetxController {
  // ดัชนีสำหรับติดตามว่ากดการ์ดไหน (0, 1, 2)
  final selectedFeatureIndex = 0.obs;

  // เรียกใช้งานเมื่อต้องการเริ่มกระบวนการตรวจจับภาพ
  void startDetection(int index) {
    selectedFeatureIndex.value = index;
    // ไปหน้า camdetect แล้วรอผลกลับมา
    Get.toNamed('/camdetect')?.then((_) {
      // หลังจาก camdetect เสร็จ ให้ไป result ตาม index ที่เลือก
      switch (index) {
        case 0:
          Get.toNamed('/result01');
          break;
        case 1:
          Get.toNamed('/result02');
          break;
        case 2:
          Get.toNamed('/result03');
          break;
      }
    });
  }

  // สำหรับใช้ใน bottom navigation bar
  void navigateToPage(String route) {
    if (route == '/homepage') {
      // อยู่หน้าเดิม ไม่ทำอะไร
    } else {
      Get.toNamed(route);
    }
  }
}
