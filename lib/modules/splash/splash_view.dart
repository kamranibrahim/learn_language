import 'package:c_s/modules/splash/splash_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(
        init: SplashLogic(),
        builder: (logic){
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(Siz.standardMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/on_boarding_2.png', height: 278,width: double.infinity,)
                ],
              ),
            ),
          );
    });
  }
}
