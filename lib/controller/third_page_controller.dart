import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:suitmedia_batch7/model/usernames_response_model.dart';
import 'package:suitmedia_batch7/service/username_service.dart';

class ThirdPageController extends GetxController {
  Rx<UsernamesResponseModel> usernamesResponse = UsernamesResponseModel().obs;
  RxBool loading = false.obs;
  RxString error = ''.obs;
  final chosenName = Rxn<String>();

  void getData() async {
    loading.value = true;
    try {
      final response = await UsernameService.getData();
      usernamesResponse.value = response;
    } on DioException catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
    }
  }

  void selectUsername(String username) {
    chosenName.value = username;
  }
}
