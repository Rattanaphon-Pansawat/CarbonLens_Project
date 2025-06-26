import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/result03_controllers.dart';

class Result03View extends GetView<Result03Controller> {
  const Result03View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result 03')),
      body: const Center(child: Text('Result03View (ยังไม่พัฒนา)')),
    );
  }
}
