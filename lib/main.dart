import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      title: "FuelMetrics",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.purple),
        primaryColor: Colors.purple,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
      ),
    ),
  );
}

