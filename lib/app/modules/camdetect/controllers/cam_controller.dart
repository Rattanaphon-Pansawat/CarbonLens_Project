import 'dart:async';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CAMEController extends GetxController {
  RxDouble cameraHeight = 0.0.obs; // ความสูงกล้องจากพื้น
  RxDouble pitchAngle = 0.0.obs; // มุมเงยกล้องปัจจุบัน
  RxDouble treeHeight = 0.0.obs; // ความสูงต้นไม้ที่คำนวณได้

  RxnDouble bottomAngle = RxnDouble(); // มุมที่รากต้นไม้
  RxnDouble topAngle = RxnDouble(); // มุมที่ยอดต้นไม้

  StreamSubscription? _sensorSubscription;

  @override
  void onInit() {
    super.onInit();
    _startListeningSensors();
  }

  void _startListeningSensors() {
    _sensorSubscription = accelerometerEvents.listen((event) {
      double pitch = _calculatePitch(event.x, event.y, event.z);
      pitchAngle.value = pitch;
    });
  }

  double _calculatePitch(double x, double y, double z) {
    double radians = math.atan2(-x, math.sqrt(y * y + z * z));
    return radians * 180 / math.pi;
  }

  void saveBottomAngle() {
    bottomAngle.value = pitchAngle.value;
  }

  void saveTopAngle() {
    topAngle.value = pitchAngle.value;
  }

  void calculateTreeHeight() {
    if (bottomAngle.value != null && topAngle.value != null) {
      double h = cameraHeight.value;
      double radBottom = bottomAngle.value! * math.pi / 180;
      double radTop = topAngle.value! * math.pi / 180;

      double height = h * (math.tan(radTop) - math.tan(radBottom));
      treeHeight.value = height;
    }
  }

  @override
  void onClose() {
    _sensorSubscription?.cancel();
    super.onClose();
  }
}