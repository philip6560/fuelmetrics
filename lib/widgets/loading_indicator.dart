import 'package:flutter/material.dart';
import 'package:get/get.dart';

loading(BuildContext? context){

  return Get.dialog(
    Center(
      child: Builder(
        builder: (BuildContext context) {
          return const CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(Colors.purple),
          );
        },
      ),
    ),
    barrierDismissible: false,
  );
}


class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation(Colors.purple),
        ),
      ),
    );
  }
}
