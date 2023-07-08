

import 'package:get/get.dart';

class LoginLogic extends GetxController{


  var isSingUpView = false.obs;

  void onLoginPressed() {

  }

  void onSignUpPressed() {
    isSingUpView(!isSingUpView());
  }
}