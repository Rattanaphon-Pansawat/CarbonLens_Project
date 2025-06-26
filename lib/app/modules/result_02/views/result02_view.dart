import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/result02_controllers.dart';

class Result02View extends GetView<Result02Controller> {
  const Result02View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result 02')),
      body: const Center(child: Text('Result02View (ยังไม่พัฒนา)')),
    );
  }
}
