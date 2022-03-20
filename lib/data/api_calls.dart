import  'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/data/models/driver.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'models/User.dart';

class ApiProvider{

  static final ApiProvider _instance = ApiProvider._internal();

  ApiProvider._internal();

  static ApiProvider get instance => _instance;

  static const BASE_URL = "https://demoapi.remis.ng";
  static const LOGIN = "/Login";
  static const LIST_OF_DRIVERS = "/Drivers/All";
  static const DELETE_DRIVER = "/Drivers/Delete";
  static const ADD_DRIVER = "/Drivers/Add";
  static const EDIT_DRIVER = "/Drivers/Edit";

  late String token;
  late Rx<User> user;

  Map<String, dynamic> headers = <String, dynamic>{
    'Content-Type': 'application/json'
  };

  var client = Dio(
    BaseOptions(
    baseUrl: BASE_URL,
    headers: {
      'Content-Type': 'application/json'
    },
  ),);

  void _resetClientHeader(){

    client.options = BaseOptions(
      baseUrl: BASE_URL,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
  }

  Future<bool> login({required Map<String, dynamic> userCredentials})async{

    try{

      var response = await client.post(LOGIN, data: userCredentials);

      token = response.data["token"];

      _resetClientHeader();

      user = User(name: response.data["fullName"], id: response.data["userId"]).obs;

      return true;

    }
    catch (e){

      return false;
    }
  }



  Future<List<Driver>> getListOfDriver()async{

    List<Driver> temp = [];

    try{

      var response = await client.get(LIST_OF_DRIVERS, queryParameters: <String, dynamic>{
        "count": true,
        "companyId": "96f583d7-7395-412d-bb7c-5f6747ab479b",
      });

      temp = response.data.map<Driver>((json){

        return Driver.fromJson(json);
      }).toList();

      return temp;
    }
    catch (e){

      return temp;
    }
  }


  Future<bool> deleteDriver({required String companyId, required String driverId})async{

    try{

      var response = await client.delete("$DELETE_DRIVER/$companyId/$driverId");

      print("$response");

      return true;
    }
    catch(e){

      print("Error: $e");

      return false;
    }
  }


  Future<void> addNewDriver({required String companyId, required Driver driverDetails})async{

    await ApiProvider.instance.client.post("$ADD_DRIVER/$companyId", data: driverDetails.toJson());
  }


  Future<void> sendDetailsForUpdate({required String companyId, required String driverId, required Driver driverDetails})async{

    print("Details: ${}");

    await ApiProvider.instance.client.put("$EDIT_DRIVER/$companyId/$driverId", data: driverDetails.toJson());
  }

}
