import 'package:get/get.dart';

class HomeController extends GetxController {
  // ดัชนีของฟีเจอร์ที่เลือก (Estimate CO2, Height, Distance)
  final selectedFeatureIndex = 0.obs;

  // เริ่มการตรวจจับภาพ พร้อมไป camdetect และรอผล
  void startDetection(int index) {
    selectedFeatureIndex.value = index;
    Get.toNamed('/camedetect')?.then((_) {
      // หลังจากกลับจาก camdetect ให้พาไปยังหน้าผลลัพธ์ตาม index ที่เลือกไว้
      switch (index) {
        case 0:
          Get.offNamed('/result_01');
          break;
        case 1:
          Get.offNamed('/result_02');
          break;
        case 2:
          Get.offNamed('/result_03');
          break;
        default:
          Get.offNamed('/result');
      }
    });
  }

  // ใช้ควบคุมการเปลี่ยนหน้าใน bottom navigation bar
  void navigateToPage(String route) {
    if (route == '/home') {
      // ถ้าอยู่หน้า home อยู่แล้วไม่ต้องทำอะไร
      return;
    }
    Get.toNamed(route);
  }
}
