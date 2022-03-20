import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/modules/LoginScreen/controllers/login_controller.dart';
import 'package:fuelmetrics_test/widgets/button.dart';
import 'package:fuelmetrics_test/widgets/formfield_spacer.dart';
import 'package:fuelmetrics_test/widgets/text.dart';
import 'package:fuelmetrics_test/widgets/textformfield.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {

  @override
  // TODO: implement controller
  LoginController get controller => Get.put(LoginController());

  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          children: [

            SizedBox(height: 150.0),

            const Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: "Welcome!",
                fontSize: 50.0,
                color: Colors.purple,
              ),
            ),

            const SizedBox(height: 60.0),

            Obx(()=> Form(
                key: controller.formKey.value,
                child: Column(
                  children: [


                    CustomTextFormField(
                      label: "Email",
                      controller: controller.emailController,
                      validator: (val){
                        return controller.validateEmail(val);
                      },
                    ),

                    const FormFieldSpacer(),

                    CustomTextFormField(
                      label: "Password",
                      controller: controller.passwordController,
                      validator: (val){
                        return controller.validatePassword(val);
                      },
                    ),


                  ],
                ),
              ),
            ),

            const SizedBox(height: 56.0),

            CustomButton(
              buttonText: 'Login',
              onPressed: controller.validateCredentials,
            ),

          ],
        ),
      ),
    );
  }
}
