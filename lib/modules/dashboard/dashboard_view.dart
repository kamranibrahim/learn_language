import 'package:c_s/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/input.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../S.dart';
import 'dashboard_logic.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardLogic>(
        init: DashboardLogic(),
        builder: (logic){
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin, vertical: Siz.standardMargin),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: pBoxDecoration(
                              radius: 5,
                              color: Clr.colorWhite,
                              shadowColor: Clr.colorBlack.withOpacity(0.1),
                              shadowRadius: 10
                            ),
                            child: Center(
                              child: Image.asset('assets/images/menu.png'),
                            ),
                          ),
                          const Txt('Muhammad', fontSize: 20,),
                        ],
                      ),
                      const MyDivider(),
                      const MyDivider(),
                      const MyDivider(),
                      buildContainer(iconImage: 'assets/images/vocabulary.png', title: 'Vocabulary', onTap: logic.onVocabularyTap),
                      const MyDivider(),
                      buildContainer(iconImage: 'assets/images/text.png', title: 'Text', onTap: logic.onTextTap),
                      const MyDivider(),
                      const MyDivider(),
                      Image.asset('assets/images/child_photo.png', height: 330,)
                    ],
                  ),
                ),
              ),
            )
          );
    });
  }

  GestureDetector buildContainer({required String iconImage, required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 92,
        width: double.infinity,
        decoration: S.buildGradient(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MyVerticalDivider(),
            const MyVerticalDivider(),
            Image.asset(iconImage, height: 50, width: 50,color: Clr.colorWhite,),
            const MyVerticalDivider(),
            const MyVerticalDivider(),
            Txt(title, fontSize: 24, textColor: Clr.colorWhite,)
          ],
        ),
      ),
    );
  }
}
