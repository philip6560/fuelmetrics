import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/data/api_calls.dart';
import 'package:fuelmetrics_test/routes/app_pages.dart';
import 'package:fuelmetrics_test/widgets/loading_indicator.dart';
import 'package:fuelmetrics_test/widgets/snackbar.dart';
import 'package:get/get.dart';

import '../../../data/models/driver.dart';

class HomeScreenController extends GetxController {

  RxList<Driver> listOfDriver = <Driver>[].obs;
  RxBool fetchingListOfDrivers = true.obs;

  void getToEditView(Driver driver){
    Get.toNamed(Routes.EDIT_DRIVER_SCREEN, arguments: driver);
  }

  void getToAddView(){
    Get.toNamed(Routes.ADD_DRIVER_SCREEN);
  }

  Future<void> deleteDriver(int index)async{

    loading(Get.context);

    bool isDeleteSuccessful = await ApiProvider.instance.deleteDriver(
        companyId: listOfDriver[index].companyId,
        driverId: listOfDriver[index].id
    );

    if(isDeleteSuccessful){

      listOfDriver.value.remove(index);
      listOfDriver.refresh();

      Get.back();
    }
    else{

      Get.back();

      snackBar(title: "Delete Error", message: "Failed to delete Driver");
    }
  }

  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getListOfDrivers();
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getListOfDrivers()async{

    fetchingListOfDrivers(true);

    try{

      listOfDriver.value = await ApiProvider.instance.getListOfDriver();
    }
    catch (e){

      throw e;
    }

    fetchingListOfDrivers(false);
  }

}
