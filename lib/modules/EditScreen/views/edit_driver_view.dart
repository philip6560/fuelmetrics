import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/modules/EditScreen/controllers/edit_driver_controller.dart';
import 'package:get/get.dart';

import '../../../widgets/button.dart';
import '../../../widgets/formfield_spacer.dart';
import '../../../widgets/textformfield.dart';

class EditDriverView extends GetView<EditController> {

  const EditDriverView({Key? key}) : super(key: key);

  @override
  EditController get controller => Get.put(EditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Driver Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 60.0),

            Obx(()=> Form(
              key: controller.formKey.value,
              child: Column(
                children: [


                  CustomTextFormField(
                    label: "Full Name",
                    controller: controller.nameController,
                    validator: (val){
                      return controller.regularValidator(val);
                    },
                  ),

                  const FormFieldSpacer(),

                  CustomTextFormField(
                    label: "Email",
                    controller: controller.emailController,
                    validator: (val){
                      return controller.validateEmail(val);
                    },
                  ),

                  const FormFieldSpacer(),

                  CustomTextFormField(
                    label: "Phone",
                    controller: controller.phoneController,
                    validator: (val){
                      return controller.regularValidator(val);
                    },
                  ),

                  const FormFieldSpacer(),

                  CustomTextFormField(
                    label: "Address",
                    controller: controller.addressController,
                    validator: (val){
                      return controller.regularValidator(val);
                    },
                  ),

                  const FormFieldSpacer(),

                  CustomTextFormField(
                    label: "State",
                    controller: controller.stateController,
                    validator: (val){
                      return controller.regularValidator(val);
                    },
                  ),

                  const FormFieldSpacer(),

                  CustomTextFormField(
                    label: "City",
                    controller: controller.cityController,
                    validator: (val){
                      return controller.regularValidator(val);
                    },
                  ),


                ],
              ),
            ),
            ),

            const SizedBox(height: 56.0),

            CustomButton(
              buttonText: 'Update Details',
              onPressed: controller.updateDriverDetails,
            ),

          ],
        ).paddingSymmetric(horizontal: 17.0),
      ),
    );
  }
}
