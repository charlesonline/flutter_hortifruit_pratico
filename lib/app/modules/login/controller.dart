import 'package:app_hortifruit_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruit_pratico/app/data/services/auth/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'cliente@email.com');
  var passwordController = TextEditingController(text: '123456');

  void login() {
    // Get.focusScope!.unfocus();
    
    if (!formKey.currentState!.validate()) {
      return;
    }

    var userLoginRequestModel = UserLoginRequestModel(
      email: emailController.text, 
      password: passwordController.text
    );

    _authService
      .login(userLoginRequestModel)
      .then((value) => null);
  }
}
