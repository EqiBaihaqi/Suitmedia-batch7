import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_batch7/constant/color_constant.dart';
import 'package:suitmedia_batch7/constant/text_style_constant.dart';
import 'package:suitmedia_batch7/controller/first_page_controller.dart';
import 'package:suitmedia_batch7/controller/third_page_controller.dart';
import 'package:suitmedia_batch7/pages/third_page/third_page.dart';
import 'package:suitmedia_batch7/wigdet/elevated_button_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firstPageController = Get.put(FirstPageController());
    final thirdpageController = Get.put(ThirdPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyleConstant.poppins600.copyWith(
            color: ColorConstant.primaryBlackColor,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 48,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(
              height: 13,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome',
                    style: TextStyleConstant.poppins400.copyWith(fontSize: 12),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    firstPageController.nameController.text,
                    style: TextStyleConstant.poppins600.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
                child: Obx(
              () => Text(
                thirdpageController.chosenName.value ?? 'Select User Name',
                style: TextStyleConstant.poppins600.copyWith(
                  fontSize: 24,
                ),
              ),
            )),
            const Spacer(),
            Center(
              child: ElevatedButtonCustomWidget(
                label: 'Choose a User',
                onPressed: () {
                  thirdpageController.getData();
                  Get.to(() => const ThirdPage());
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
