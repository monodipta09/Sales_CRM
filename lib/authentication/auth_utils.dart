import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Controllers/auth_controller.dart';

void handleResetPassword(GlobalKey<FormState> formKey, TextEditingController usernameController, AuthController authController){
  if(formKey.currentState!.validate()){
    authController.isLoading.value = true;
    authController.resetPassword(usernameController.text);
  }else{
    Get.snackbar("Error", "Username cannot be empty",
        snackPosition: SnackPosition.TOP, colorText: Colors.white);
  }
}

void handleLogin(BuildContext context, GlobalKey<FormState> formKey, TextEditingController usernameController, TextEditingController passwordController, AuthController authController) {
  if (formKey.currentState!.validate()) {
    authController.isLoading.value = true;
    authController.login(usernameController.text, passwordController.text);
  } else {
    Get.snackbar("Error", "Username and Password cannot be empty",
        snackPosition: SnackPosition.TOP, colorText: Colors.white);
  }
}

void handleResetPasswordIos(GlobalKey<FormState> formKey, TextEditingController usernameController, AuthController authController){
  if(formKey.currentState!.validate()){
    authController.isLoading.value = true;
    authController.resetPassword(usernameController.text);
  }else{
    Get.snackbar("Error", "Username cannot be empty",
        snackPosition: SnackPosition.TOP, colorText: CupertinoColors.white);
  }
}

void handleLoginIos(BuildContext context, TextEditingController usernameController, TextEditingController passwordController, AuthController authController) {
  if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    authController.isLoading.value = true;
    authController.login(usernameController.text, passwordController.text);
  } else {
    Get.snackbar("Error", "Username and Password cannot be empty",
        snackPosition: SnackPosition.TOP, colorText: CupertinoColors.white);
  }
}
