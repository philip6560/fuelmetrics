import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/routes/app_pages.dart';
import 'package:fuelmetrics_test/widgets/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Future loading()async{
    await Future.delayed(const Duration(seconds: 1));
    await Get.offNamed(Routes.LOGIN_SCREEN);
  }

  @override
  void initState() {
    loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(
          text: "FuelMetrics.",
          fontSize: 60.0,
          fontWeight: FontWeight.w500,
          color: Colors.purple,
        ),
      ),
    );
  }
}

