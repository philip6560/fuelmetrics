import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/data/api_calls.dart';
import 'package:fuelmetrics_test/routes/app_pages.dart';
import 'package:fuelmetrics_test/widgets/loading_indicator.dart';
import 'package:get/get.dart';

import '../../../widgets/snackbar.dart';

class LoginController extends GetxController {

  var formKey = GlobalKey<FormState>().obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateEmail(val){

    if(!GetUtils.isEmail(val.toString().trim())){

      return "Enter a valid email";
    }
  }

  String? validatePassword(val){

    if(val.isEmpty){

      return "Enter password";
    }
  }


  Future<void> validateCredentials()async{

    if(formKey.value.currentState!.validate()){

      loading(Get.context);

      bool isLoginSuccessful = await _login();

      Get.back();

      if(isLoginSuccessful){

        Get.offNamed(Routes.HOME);
      }
      else{

        snackBar(title: "Login Error", message: "Failed to login");
      }

    }
  }


  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // getProjects(token.value);
  }

  @override
  void onClose() {}

  Future<bool> _login()async{

    return await ApiProvider.instance.login(
        userCredentials: <String, dynamic>{
          "email": emailController.text.trim(),
          "password": passwordController.text,
        }
    );
  }

}
