import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_batch7/constant/color_constant.dart';
import 'package:suitmedia_batch7/constant/text_style_constant.dart';
import 'package:suitmedia_batch7/controller/third_page_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final thirdController = Get.put(ThirdPageController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: TextStyleConstant.poppins600.copyWith(
            color: ColorConstant.primaryBlackColor,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 48,
      ),
      body: Obx(() {
        if (thirdController.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (thirdController.error.isNotEmpty) {
          return Center(
            child: Text(
              thirdController.error.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return Column(
            children: [
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      thirdController.usernamesResponse.value.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final data =
                        thirdController.usernamesResponse.value.data?[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              thirdController.selectUsername(
                                '${data?.firstName} ${data?.lastName}',
                              );

                              Get.back();
                            },
                            child: SizedBox(
                              width: 335,
                              height: 80,
                              child: ListTile(
                                title: Text(
                                  '${data?.firstName} ${data?.lastName}',
                                  style: TextStyleConstant.poppins500.copyWith(
                                    fontSize: 16,
                                    color: ColorConstant.primaryBlackColor,
                                  ),
                                ),
                                subtitle: Text(
                                  '${data?.email}',
                                  style: TextStyleConstant.poppins500.copyWith(
                                      color: ColorConstant.subtitleTextColor,
                                      fontSize: 10),
                                ),
                                leading: SizedBox(
                                  width: 49,
                                  height: 49,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data?.avatar ?? ''),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
