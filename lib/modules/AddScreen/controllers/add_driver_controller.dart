import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/data/api_calls.dart';
import 'package:fuelmetrics_test/widgets/loading_indicator.dart';
import 'package:get/get.dart';

import '../../../data/models/driver.dart';

class AddController extends GetxController {

  var formKey = GlobalKey<FormState>().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String? validateEmail(val){

    if(!GetUtils.isEmail(val.toString().trim())){

      return "Enter a valid email";
    }
  }

  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
