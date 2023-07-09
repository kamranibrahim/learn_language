import 'package:c_s/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/input.dart';
import 'package:my_widgets/widgets/txt.dart';
import 'login_logic.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogic>(
      init: LoginLogic(),
        builder: (logic){
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin, vertical: Siz.standardMargin),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/on_boarding_2.png', width: double.infinity,),
                    const MyDivider(),
                    const Txt('Welcome!', fontSize: 20,),
                    const MyDivider(),
                    buildFormView(logic),
                    const MyDivider(),
                    Obx(() => Column(
                      children: [
                        Btn(
                          text: logic.isSingUpView() ? 'Sign up' : 'Login',
                          height: 52,
                          textColor: Clr.colorWhite,
                          radius: 20,
                          textSize: 18,
                          hasBold: true,
                          width:   double.infinity,
                          bgColor: Clr.colorPrimary,
                          onPressed: logic.onLoginPressed,
                        ),
                        const MyDivider(),
                        Btn(
                          text: logic.isSingUpView() ? 'Login' : 'Sign up',
                          height: 52,
                          textColor: Clr.colorBlack,
                          radius: 20,
                          hasBold: true,
                          width:   double.infinity,
                          hasBorder: true,
                          borderColor: Clr.colorGrey,
                          bgColor: Clr.colorWhite,
                          shadowColor: Clr.colorWhite,
                          onPressed: logic.onSignUpPressed,
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
    });
  }

  Widget buildFormView(LoginLogic logic) {
    return  Obx(() => Column(
      children: [
        if(logic.isSingUpView())...[
          const TxtFormInput(
            hintText: 'Full Name',
            hasBorder: true,
            fillColor: Clr.colorGreyLight,
          ),
          const MyDivider(),
        ],
        const TxtFormInput(
          hintText: 'Email Address',
          hasBorder: true,
          fillColor: Clr.colorGreyLight,
        ),
        const MyDivider(),
        const TxtFormInput(
          hintText: 'Password',
          hasBorder: true,
          fillColor: Clr.colorGreyLight,
        ),
        if(logic.isSingUpView())...[
          const MyDivider(),
          const TxtFormInput(
            hintText: 'Confirm Password',
            hasBorder: true,
            fillColor: Clr.colorGreyLight,
          ),
        ]
      ],
    ));
  }
}
