import 'dart:math';
import 'package:c_s/modules/vocab_story/vocab_story_logic.dart';
import 'package:c_s/modules/vocab_story/vocab_story_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/input.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../S.dart';
import '../../utils/utils.dart';

class VocabLessonView extends StatelessWidget {
  const VocabLessonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VocabStoryLogic(),
      builder: (logic) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
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
                        'Vocabulary',
                        fontSize: 28,
                        textColor: Clr.colorWhite,
                      ),
                    ),
                  ),
                  const MyDivider(),
                  const Txt(
                    'STORY 1',
                    fontSize: 24,
                    textColor: Clr.colorRed,
                  ),
                  const MyDivider(),
                  const MyDivider(),
                  if(logic.finishEnabled)
                    buildFinishedView(logic)
                  else Container(
                    height: logic.word?.type == QuestionType.mcq.name ? 350 : 240,
                    width: double.infinity,
                    padding: const EdgeInsets.all(Siz.standardMargin),
                    margin: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
                    decoration: pBoxDecoration(
                        radius: 32,
                        color: Clr.colorWhite,
                        shadowColor: Clr.colorBlack.withOpacity(0.08),
                        shadowRadius: 30,
                        shadowOffset: const Offset(0, 10)),
                    // duration: 500.milliseconds,
                    child: Column(
                      children: [
                        Txt(
                          logic.word?.word,
                          fontSize: 24,
                        ),
                        const MyDivider(),
                        if (logic.word?.type == QuestionType.text.name) ...[
                          buildInputView(logic),
                        ] else if (logic.word?.type == QuestionType.speak.name) ...[
                          buildSpeechView(logic),
                        ] else if (logic.word?.type == QuestionType.mcq.name) ...[
                          buildMCQsView(logic, logic.word!),
                        ],
                      ],
                    ),
                  ),
                  const MyDivider(),
                  const MyDivider(),
                  const MyDivider(),
                  if(!logic.finishEnabled)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var index = 0; index < logic.dummyWords.length; index++)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: logic.selectedQuestionIndex == index ? Clr.colorPrimary : Clr.colorTransparent,
                                    radius: 4,
                                  ),
                                  const MyDivider(height: 10,),
                                  GestureDetector(
                                    onTap: ()=> logic.onNumberPressed(index),
                                    child: Container(
                                      height: 26,
                                      width: 50,
                                      decoration: pBoxDecoration(
                                        radius: 10,
                                        color: Clr.colorWhite,
                                        hasBorder: true,
                                        borderColor: Clr.colorGrey,
                                      ),
                                      child: Center(child: Txt((index+1) == logic.dummyWords.length  ? 'Finish'  : (index + 1).toString())),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildInputView(VocabStoryLogic logic) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyDivider(),
        TxtFormInput(
          hintText: 'Type answer here',
          // removeAllBorders: true,
        )
      ],
    );
  }

  Widget buildSpeechView(VocabStoryLogic logic) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Clr.colorSecondary,
          radius: 30,
          child: const Icon(Icons.mic_none_outlined, size: 30, color: Clr.colorBlack,),
        ),
        const MyDivider(),
        const MyDivider(),
        const Txt('Skip', fontSize: 16,)
      ],
    );
  }

  Column buildMCQsView(VocabStoryLogic logic, WordModel word) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Clr.colorSecondary,
          child: Image.asset(
            'assets/images/audio.png',
            height: 26,
            width: 30,
          ),
        ),
        const MyDivider(),
        const MyDivider(),
        Wrap(
          spacing: Siz.standardMargin * 2,
          runSpacing: Siz.standardMargin * 2,
          children: [
            for (var index = 0; index < word.options.length; index++)
              GestureDetector(
                onTap: () => logic.checkAnswer(index),
                child: Container(
                  height: 60,
                  width: 120,
                  decoration: pBoxDecoration(
                    radius: 6,
                    color: logic.selectedOptionIndex != null && logic.selectedOptionIndex == index
                        ? logic.isCorrect
                        ? Clr.colorPrimary
                        : Clr.colorGreyLight
                        : Clr.colorWhite,
                    shadowOffset: const Offset(0, 10),
                    shadowRadius: 30,
                    shadowColor: Clr.colorBlack.withOpacity(0.08),
                  ),
                  child: Center(
                    child: Txt(
                      word.options[index],
                      fontSize: 18,
                      textColor: logic.selectedOptionIndex != null && logic.selectedOptionIndex == index
                          ? logic.isCorrect
                          ? Clr.colorWhite
                          : Clr.colorBlack
                          : null,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const MyDivider(),
      ],
    );
  }

  Widget buildFinishedView(VocabStoryLogic logic) {
    return Column(
      children: [
        Image.asset('assets/images/completed.png', height: 150, width: 230,),
        const MyDivider(),
        const MyDivider(),
        const MyDivider(),
        SizedBox(
          width: 126,
          height: 126,
          child: CustomPaint(
            foregroundPainter: BorderProgressBar(
              color: Clr.colorPrimary,
              width: 2,
              progress: 0.85,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Clr.colorPrimaryLight,
                radius: 50,
                child: Center(
                    child: Txt(
                      '85%',
                      fontSize: 24,
                      textColor: Clr.colorPrimary,
                      hasBold: true,
                    )),
              ),
            ),
          ),
        ),
        const MyDivider(),
        const MyDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Siz.standardMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: logic.onRepeatPressed,
                child: Container(
                  height: 92,
                  width: 120,
                  decoration: pBoxDecoration(
                    color: Clr.colorWhite,
                    hasBorder: true,
                    borderColor: Clr.colorPrimary,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, size: 30,color: Clr.colorBlack.withOpacity(0.6),),
                      const MyDivider(height: 8,),
                      Txt('Repeat', fontSize: 20, textColor: Clr.colorBlack.withOpacity(0.6),)
                    ],
                  ),
                ),
              ),
              Container(
                height: 92,
                width: 180,
                decoration: pBoxDecoration(
                  color: Clr.colorPrimary,
                  hasBorder: true,
                  borderColor: Clr.colorPrimary,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_forward, size: 30,color: Clr.colorWhite),
                    MyDivider(height: 8,),
                    Txt('Try Next Story', fontSize: 20, textColor: Clr.colorWhite,)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


class BorderProgressBar extends CustomPainter {
  final Color color;
  final double width;
  final double progress;

  BorderProgressBar({
    required this.color,
    required this.width,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final strokeWidth = width;
    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(radius, radius);
    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);

    // Draw progress bar arc
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);

    final circlePaint = Paint()..color = color;

    // Draw start circle
    final startCircleOffset = Offset(
      center.dx + (radius - strokeWidth / 2) * cos(startAngle),
      center.dy + (radius - strokeWidth / 2) * sin(startAngle),
    );
    canvas.drawCircle(startCircleOffset, strokeWidth + 1, circlePaint);

    // Draw end circle
    final endCircleOffset = Offset(
      center.dx + (radius - strokeWidth / 2) * cos(startAngle + sweepAngle),
      center.dy + (radius - strokeWidth / 2) * sin(startAngle + sweepAngle),
    );
    canvas.drawCircle(endCircleOffset, strokeWidth+ 1, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

