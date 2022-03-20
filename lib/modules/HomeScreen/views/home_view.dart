import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/data/api_calls.dart';
import 'package:fuelmetrics_test/modules/HomeScreen/controllers/home_controller.dart';
import 'package:fuelmetrics_test/widgets/loading_indicator.dart';
import 'package:fuelmetrics_test/widgets/text.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeScreenController> {

  const HomeView({Key? key}) : super(key: key);

  @override
  HomeScreenController get controller => Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: MediaQuery.of(context).viewPadding.top + 30.0),

            Obx(()=> CustomText(
              text: "Welcome ${ApiProvider.instance.user.value.name},",
              fontSize: 22.0,
              ),
            ),

            const SizedBox(height: 20.0),

            const CustomText(
              text: "All drivers",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 40.0),

            Obx(()=> controller.fetchingListOfDrivers.isTrue ?
              CustomLoadingIndicator()
              : Flexible(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 5.0),
                    shrinkWrap: true,
                    itemCount: controller.listOfDriver.length,
                    itemBuilder: (BuildContext context, int index){
                      final driver = controller.listOfDriver[index];
                      return Container(
                        height: 140.0,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
                        margin: const EdgeInsets.only(bottom: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(.07),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                CustomText(
                                  text: "Name: " + driver.name,
                                  fontSize: 16.0,
                                ),

                                const SizedBox(width: 10.0),

                                Flexible(
                                  child: CustomText(
                                    text: "Email: " + driver.email,
                                    fontSize: 16.0,
                                  ),
                                ),

                              ],
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                GestureDetector(
                                  onTap: ()=> controller.getToEditView(driver),
                                  child: const Icon(Icons.edit, color: Colors.purple,).paddingAll(8.0),
                                ),

                                const SizedBox(width: 25.0),

                                GestureDetector(
                                  onTap: ()=> controller.deleteDriver(index),
                                  child: const Icon(Icons.delete, color: Colors.purple,).paddingAll(8.0),
                                ),

                              ],
                            ),

                          ],
                        ),
                      );
                    }),
                ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getToAddView,
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
