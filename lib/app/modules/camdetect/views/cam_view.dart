import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/cam_controller.dart';

class CameView extends StatefulWidget {
  const CameView({super.key});

  @override
  State<CameView> createState() => _CameViewState();
}

class _CameViewState extends State<CameView> {
  final CAMEController controller = Get.put(CAMEController());
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (cam) => cam.lensDirection == CameraLensDirection.back,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print("Camera init error: $e");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 📷 กล้อง
          _isCameraInitialized && _cameraController != null
              ? CameraPreview(_cameraController!)
              : const Center(child: CircularProgressIndicator()),

          // 🔝 Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF001524), // Midnight Void
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: SvgPicture.asset(
                      'assets/icons/back_arrow.svg',
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'กล้องตรวจจับ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Color(0xFFFFFAFA), // Snow
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🎯 เป้าเล็ง
          Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 2, height: 30, color: Colors.red),
                  Container(width: 30, height: 2, color: Colors.red),
                ],
              ),
            ),
          ),

          // 🔻 UI ส่วนล่าง
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: const Color(0xFFFFFAFA), // Snow
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ความสูงกล้อง
                  const Text(
                    'ความสูงกล้อง (เมตร)',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      color: Color(0xFF001524),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Color(0xFF001524)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'กรอกความสูงกล้อง',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      final h = double.tryParse(value);
                      if (h != null) controller.cameraHeight.value = h;
                    },
                  ),
                  const SizedBox(height: 12),
                  Obx(() => Text(
                    "มุมกล้องปัจจุบัน: ${controller.pitchAngle.value.toStringAsFixed(2)}°",
                    style: const TextStyle(fontSize: 16),
                  )),
                  Obx(() => Text(
                    "มุมราก: ${controller.bottomAngle.value?.toStringAsFixed(2) ?? '-'}°   |   มุมยอด: ${controller.topAngle.value?.toStringAsFixed(2) ?? '-'}°",
                    style: const TextStyle(fontSize: 16),
                  )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.saveBottomAngle,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF98CD00), // Arcade Glow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text.rich(
                            TextSpan(
                              text: 'บันทึกตำแหน่ง ',
                              style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: 'ราก',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.saveTopAngle,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF98CD00), // Arcade Glow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text.rich(
                            TextSpan(
                              text: 'บันทึกตำแหน่ง ',
                              style: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: 'ยอด',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.calculateTreeHeight,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF146356), // Dark Teal
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'คำนวณ CO2 และ O2',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFAFA), // Snow
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
