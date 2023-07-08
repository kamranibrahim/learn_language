
import 'package:c_s/modules/stories/stories_view.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

class DashboardLogic extends GetxController{

  onVocabularyTap() {
    pSetRout(page: ()=> const StoriesView());
  }

  onTextTap() {
    pSetRout(page: ()=> const StoriesView());
  }
}