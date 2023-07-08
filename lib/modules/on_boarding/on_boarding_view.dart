
import 'package:c_s/modules/on_boarding/on_boarding_logic.dart';
import 'package:c_s/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/txt.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardLogic>(
        init: OnBoardLogic(),
        builder: (logic){
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/curve.png', height: 149.82,width: 168.7,),
                    ],
                  ),
                ),
                // PageView(
                //   controller: ,
                // )
                Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: PageView.builder(
                          controller: logic.pageController,
                          itemCount: logic.model.length,
                          onPageChanged: logic.onPageChange,
                          itemBuilder: (context, index){
                            final item = logic.model[index];
                            return Obx(() => buildView(
                                logic, image: item.image,
                                title: item.title,
                                description: item.description,
                                currentIndex: logic.currentIndex()
                            ));
                          },
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
                        child: Obx(() => Btn(
                          text: logic.currentIndex.value == 2 ? 'Get Started' : '' ,
                          postFix: const Icon(Icons.arrow_forward, color: Clr.colorWhite,),
                          height: 52,
                          textColor: Clr.colorWhite,
                          radius: 20,
                          width:  logic.currentIndex.value == 2 ? double.infinity : 120,
                          bgColor: Clr.colorPrimary,
                          onPressed: logic.onNextPressed,
                        ),)
                      ),
                    ),
                    const MyDivider(),
                    const MyDivider(),
                    const MyDivider(),
                    const MyDivider(),
                  ],
                )
              ],
            ),
          );
    });
  }

  Padding buildView(OnBoardLogic logic, {required int currentIndex,required String image, required String title, required String description,}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Siz.standardMargin),
            child: SizedBox(
              width : double.infinity,
              child: Image.asset(image, height: 324.22),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDot(currentIndex == 0), // Dot for the first page
              buildDot(currentIndex == 1), // Dot for the second page
              buildDot(currentIndex == 2), // Dot for the third page
            ],
          ),
          const MyDivider(),
          Txt(title, fontSize: 36, textColor: Clr.colorBlack,),
          const MyDivider(height: 10,),
          Txt(description, fontSize: 16, textColor: Clr.colorGrey,textAlign: TextAlign.center,),
        ],
      ),
    );
  }


  Container buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Clr.colorPrimary : Clr.colorGrey,
      ),
    );
  }
}
