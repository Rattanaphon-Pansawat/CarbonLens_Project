import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/result01_controllers.dart';

class Result01View extends GetView<Result01Controller> {
  const Result01View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result 01')),
      body: const Center(child: Text('Result01View (ยังไม่พัฒนา)')),
    );
  }
}
