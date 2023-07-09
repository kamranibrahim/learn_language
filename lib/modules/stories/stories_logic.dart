
import 'package:c_s/modules/text_lesson/text_lesson_view.dart';
import 'package:c_s/modules/vocab_story/vocab_story_view.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

class StoriesLogic extends GetxController{
  final bool isFromText;
  StoriesLogic(this.isFromText);

  void onStoryTap() {
    if(isFromText){
      pSetRout(page: ()=> const TextLessonView());
    }else{
      pSetRout(page: ()=> const VocabLessonView());
    }
  }

  void backPressed() {
    Get.back();
  }
}