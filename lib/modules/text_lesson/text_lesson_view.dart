import 'package:c_s/modules/text_lesson/text_lesson_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../S.dart';
import '../../utils/utils.dart';

class TextLessonView extends StatelessWidget {
  const TextLessonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextLessonLogic>(
      init: TextLessonLogic(),
      builder: (logic){
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const MyDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: logic.onBackPressed,
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: pBoxDecoration(
                            radius: 5,
                            color: Clr.colorWhite,
                            shadowColor: Clr.colorBlack.withOpacity(0.1),
                            shadowRadius: 10,
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ),
                      const Txt(
                        'Muhammad',
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                const MyDivider(),
                const MyDivider(),
                Container(
                  height: 62,
                  width: double.infinity,
                  decoration: S.buildGradient(),
                  child: const Center(
                    child: Txt(
                      'Text',
                      fontSize: 28,
                      textColor: Clr.colorWhite,
                    ),
                  ),
                ),
                const MyDivider(),
                const MyDivider(),
                CircleAvatar(
                  backgroundColor: Clr.colorSecondary,
                  radius: 30,
                  child: const Icon(Icons.play_arrow, color: Clr.colorWhite,size: 40,),
                ),
                const MyDivider(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Siz.standardMargin * 2),
                  child: Txt('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', fontSize: 16,),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
