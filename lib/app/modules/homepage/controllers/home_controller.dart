import 'package:get/get.dart';

class HomeController extends GetxController {
  // กำหนด path สำหรับภาพพื้นหลัง (ในแต่ละการ์ด)
  final backgroundImages = [
    'https://static.vecteezy.com/system/resources/previews/008/198/961/large_2x/sustainable-business-with-the-planet-through-renewable-energy-and-green-co2-emissions-whereby-using-renewable-energy-can-limit-climate-change-and-global-warming-free-photo.jpg',
    'https://static.vecteezy.com/system/resources/previews/046/815/308/large_2x/beautiful-forest-nature-background-free-photo.jpg',
    'https://static.vecteezy.com/system/resources/previews/048/626/675/large_2x/canopy-of-green-leaves-in-birch-forest-nature-background-free-photo.jpg',
  ];

  // ปุ่มคำอธิบายและเส้นทางที่เชื่อมโยงกับแต่ละฟังก์ชัน
  final features = [
    {
      'title': 'วัดปริมาณ CO2 และ O2',
      'description':
          'ถ่ายภาพเพื่อวัดปริมาณการดูดซับ\nคาร์บอนไดออกไซด์ และ ออกซิเจนของต้นไม้',
      'route': '/camedetect',
    },
    {
      'title': 'คำนวณ ความสูงต้นไม้',
      'description':
          'ฟังก์ชันนี้จะพยายามประมาณ\nความสูงของวัตถุ โดยใช้ความสูงของโทรศัพท์ที่ผู้ใช้กำหนดไว้',
      'route': '/camedetect',
    },
    {
      'title': 'คำนวณ ระยะห่างต้นไม้',
      'description':
          'ฟังก์ชันนี้จะพยายามประมาณ\nระยะทางบนพื้นดิน ระหว่างตำแหน่งของโทรศัพท์กับจุดที่ถูกเล็งโดยเป้าเล็ง',
      'route': '/camedetect',
    },
  ];
}