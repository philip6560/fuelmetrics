import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/modules/AddScreen/controllers/add_driver_controller.dart';
import 'package:get/get.dart';

import '../../../widgets/button.dart';
import '../../../widgets/formfield_spacer.dart';
import '../../../widgets/textformfield.dart';

class AddDriverView extends GetView<AddController> {

  const AddDriverView({Key? key}) : super(key: key);

  @override
  // TODO: implement controller
  AddController get controller => Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Driver"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          const SizedBox(height: 60.0),

          Obx(()=> Form(
            key: controller.formKey.value,
            child: Column(
              children: [


                CustomTextFormField(
                  label: "Full Name",
                  controller: controller.emailController,
                  validator: (val){
                    return controller.validateEmail(val);
                  },
                ),

                const FormFieldSpacer(),

                CustomTextFormField(
                  label: "Email",
                  controller: controller.emailController,
                  validator: (val){
                    return ;
                  },
                ),

                const FormFieldSpacer(),

                CustomTextFormField(
                  label: "Phone",
                  controller: controller.phoneController,
                  validator: (val){
                    return ;
                  },
                ),

                const FormFieldSpacer(),

                CustomTextFormField(
                  label: "Address",
                  controller: controller.addressController,
                  validator: (val){
                    return ;
                  },
                ),

                const FormFieldSpacer(),

                CustomTextFormField(
                  label: "State",
                  controller: controller.stateController,
                  validator: (val){
                    return ;
                  },
                ),

                const FormFieldSpacer(),

                CustomTextFormField(
                  label: "City",
                  controller: controller.cityController,
                  validator: (val){
                    return ;
                  },
                ),


              ],
            ),
          ),
          ),

          const SizedBox(height: 56.0),

          CustomButton(
            buttonText: 'Update Details',
            onPressed: (){},
          ),

        ],
      ),
    );
  }
}
