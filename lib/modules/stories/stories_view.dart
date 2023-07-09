import 'package:c_s/modules/stories/stories_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../utils/utils.dart';

class StoriesView extends StatelessWidget {
  final bool isFromText;
  const StoriesView({Key? key, this.isFromText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoriesLogic>(
      init: StoriesLogic(isFromText),
      builder: (logic){
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 336,
                width: double.infinity,
                decoration: pBoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffFFB16A),
                      Color(0xffFF5681),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -60,
                      right: -60,
                      child: Image.asset('assets/images/card_overlay_top.png', height: 280, width: 280,),
                    ),
                    Positioned(
                      bottom: -100,
                      left: -100,
                      child: Image.asset('assets/images/card_overlay_bottom.png', height: 280, width: 280,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
                      child: Column(
                        children: [
                          const MyDivider(),
                          const MyDivider(),
                          const MyDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: logic.backPressed,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  padding: const EdgeInsets.all(10),
                                  decoration: pBoxDecoration(
                                      radius: 5,
                                      color: Clr.colorWhite,
                                      shadowColor: Clr.colorBlack.withOpacity(0.1),
                                      shadowRadius: 10
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.arrow_back_ios_new),
                                    // child: Image.asset('assets/images/menu.png'),
                                  ),
                                ),
                              ),
                              const Txt('Muhammad', fontSize: 20,textColor: Clr.colorWhite,),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Txt(isFromText ? 'Text' : 'Vocabulary', fontSize: 38, textColor: Clr.colorWhite,),
                                const Txt('Listen to your favorite stories! Enjoy reading fun and colorful stories', fontSize: 18, textColor: Clr.colorWhite,textAlign: TextAlign.center,),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const MyDivider(),
              const MyDivider(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(
                          7, (index) => GestureDetector(
                        onTap: logic.onStoryTap,
                        child: Container(
                          decoration: pBoxDecoration(
                            radius: 8,
                            color: Clr.colorPrimary,
                            shadowRadius: 30,
                            shadowColor: Clr.colorBlack.withOpacity(0.08),
                            shadowOffset: const Offset(0, 10),
                          ),
                          height: 120,
                          child: Column(
                            children: [
                              Container(
                                height: 112,
                                width: 144,
                                decoration: pBoxDecoration(
                                    color: Clr.colorWhite,
                                    radius: 0
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          ...List.generate(
                                            3, (index) => const Icon(Icons.star_border, size: 16,),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Center(child: Txt('Story ${index + 1}', fontSize: 20, hasBold: true,))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              const MyDivider(),
            ],
          ),
        );
      },
    );
  }
}
