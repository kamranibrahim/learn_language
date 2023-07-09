
import 'package:c_s/modules/vocab_story/vocab_story_model.dart';
import 'package:get/get.dart';

class VocabStoryLogic extends GetxController {
  int selectedQuestionIndex = 0;
  int? selectedOptionIndex;
  bool isCorrect = false;
  bool finishEnabled = false;

  List<WordModel> dummyWords = [
    WordModel(word: 'Spoon', answerIndex: 0, options: ['scoop', 'fork', 'knife', 'plate'], type: QuestionType.mcq.name  ),
    WordModel(word: 'Chair', answerIndex: 2, translatedWord: 'Chair',options: [], type: QuestionType.speak.name),
    WordModel(word: 'Book', answerIndex: 1, options: [], translatedWord: 'Book',type: QuestionType.text.name),
  ];
  List<WordModel> list = [];

  WordModel? word;

  void checkAnswer(int index) {
    selectedOptionIndex = index;
    isCorrect = selectedOptionIndex == dummyWords[selectedQuestionIndex].answerIndex;
    update();
  }

  void onNumberPressed(int index) {
    if(index+1 == dummyWords.length){
      finishEnabled = true;
    }else{
      selectedQuestionIndex = index;
      selectedOptionIndex = null;
      word = dummyWords[selectedQuestionIndex];
      isCorrect = false;
    }
    update();
  }

  @override
  void onInit() {
    list.assignAll(dummyWords);
    dummyWords.add(WordModel(word: '', answerIndex: -1, options: [], type: QuestionType.mcq.name));
    word = dummyWords[selectedQuestionIndex];
    super.onInit();
  }

  void onBackPressed() {
    Get.back();
  }

  void onRepeatPressed() {
    finishEnabled = false;
    selectedQuestionIndex = 0;
    update();
  }
}