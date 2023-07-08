

import 'package:c_s/modules/dashboard/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

class LoginLogic extends GetxController{


  var isSingUpView = false.obs;

  void onLoginPressed() {
    pSetRout(page: ()=> const DashboardView());
  }

  void onSignUpPressed() {
    isSingUpView(!isSingUpView());
  }
}