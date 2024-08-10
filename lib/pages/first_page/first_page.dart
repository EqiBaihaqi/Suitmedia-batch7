import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_batch7/controller/first_page_controller.dart';
import 'package:suitmedia_batch7/wigdet/elevated_button_widget.dart';
import 'package:suitmedia_batch7/pages/first_page/textfield_widget.dart';
import 'package:suitmedia_batch7/pages/second_page/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FirstPageController());
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image/background1.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/image/ic_photo@3x.png'),
                width: 116,
                height: 116,
              ),
              const SizedBox(
                height: 51,
              ),
              TextFieldCustomWidget(
                controller: controller.nameController,
                label: 'Name',
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldCustomWidget(
                controller: controller.polindromeController,
                label: 'Polindrome',
              ),
              const SizedBox(
                height: 45,
              ),
              ElevatedButtonCustomWidget(
                  label: 'CHECK',
                  onPressed: () {
                    controller.checkPalindrome();
                  }),
              const SizedBox(
                height: 15,
              ),
              ElevatedButtonCustomWidget(
                label: 'NEXT',
                onPressed: () {
                  Get.to(() => const SecondPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
