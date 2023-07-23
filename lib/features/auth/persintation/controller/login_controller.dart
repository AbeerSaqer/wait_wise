import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_project/firebase/fb_auth_controller.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var formKey = GlobalKey<FormState>();
  double? progressValue = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void performLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    Get.snackbar('Enter required data!', "");
    return false;
  }

  void login() async {
    changeProgressValue(value: null);
    final email = emailController.text.trim();
    final password = passwordController.text;

    bool status = await FbAuthController().signIn(
      context: context as BuildContext,
      email: email,
      password: password,
    );

    changeProgressValue(value: status ? 1 : 0);

    if (status) {
      Get.snackbar("", 'Login Successfully');
      Get.back();
      Get.offAllNamed('/home_view');
    } else {
      Get.back();
    }
  }

  void changeProgressValue({required double? value}) {
    progressValue = value;
  }
}
