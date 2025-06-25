import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
      title: "CarbonsLens",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
