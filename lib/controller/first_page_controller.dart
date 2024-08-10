import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_batch7/constant/color_constant.dart';

class FirstPageController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController polindromeController = TextEditingController();
  RxString palindromeResult = ''.obs;
  @override
  void dispose() {
    nameController.dispose();
    polindromeController.dispose();
    super.dispose();
  }

  // Polindrome Checker
  void checkPalindrome() {
    String text = polindromeController.text;
    String processedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = processedText.split('').reversed.join('');
    palindromeResult.value = (processedText == reversedText)
        ? 'It\'s a palindrome!'
        : 'Not a palindrome!';

    Get.snackbar('RESULT', palindromeResult.value,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        colorText: ColorConstant.primaryWhiteColor);
  }
}
