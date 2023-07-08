
import 'package:c_s/modules/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

class SplashLogic extends GetxController{

  @override
  void onInit() {
    callInit();
    super.onInit();
  }


  Future<void> callInit() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(3.seconds, (){
        pSetRout(page: () => const OnBoardingView(), routeType: RouteType.pushReplace);
      });
    });
  }

}

