import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/data/api_calls.dart';
import 'package:fuelmetrics_test/modules/HomeScreen/controllers/home_controller.dart';
import 'package:fuelmetrics_test/widgets/loading_indicator.dart';
import 'package:fuelmetrics_test/widgets/snackbar.dart';
import 'package:get/get.dart';

import '../../../data/models/driver.dart';

class EditController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  Rx<Driver> _driver = Driver().obs;

  String? validateEmail(val) {

    if (!GetUtils.isEmail(val.toString().trim())) {
      return "Enter a valid email";
    }
  }

  String? regularValidator(val){

    if(val.isEmpty){

      return "Enter value";
    }
  }

  Future<void> updateDriverDetails() async {

    if (formKey.value.currentState!.validate()) {

      loading(Get.context);

      await _sendDetailsForUpdate();

      Get.back();

    }
  }

  Future<void> _refreshHomeScreenData()async{

    await Get.find<HomeScreenController>().getListOfDrivers();
  }

  Driver _getDriverDetails() {
    return Driver(
      id: ApiProvider.instance.user.value.id,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      address: addressController.text,
      state: stateController.text,
      city: cityController.text,
    );
  }

  void _initializeScreenResources() {

    _driver.value = Get.arguments;

    _setDriverDetails();
  }

  void _setDriverDetails() {
    nameController.text = _driver.value.name;
    emailController.text = _driver.value.email;
    phoneController.text = _driver.value.phone;
    addressController.text = _driver.value.address;
    stateController.text = _driver.value.state;
    cityController.text = _driver.value.city;
  }

  @override
  void onInit() {
    _initializeScreenResources();
    super.onInit();
  }

  void _onSuccessfullyUpdatedDetails(){

    _refreshHomeScreenData();

    snackBar(title: "Update Successful:", message: "Successfully updated details");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> _sendDetailsForUpdate() async {

    try {
      await ApiProvider.instance.sendDetailsForUpdate(
          driverId: _driver.value.id,
          companyId: _driver.value.companyId,
          driverDetails: _getDriverDetails());

      _onSuccessfullyUpdatedDetails();
    }
    catch (e) {

      print("error $e");

      Get.back();

      snackBar(title: "Update Error:", message: "Failed to update details");
    }
  }
}
