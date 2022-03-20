import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBar({required String title, required String message}){

  return Get.snackbar(title ,message, backgroundColor: Colors.purple, colorText: Colors.white);
}