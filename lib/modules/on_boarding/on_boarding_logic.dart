import 'package:c_s/modules/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

class OnBoardLogic extends GetxController {
  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  List<OnBoardingModel> model = [
    OnBoardingModel(
      title: 'Listen and Learn',
      image: 'assets/images/on_boarding1.png',
      description: 'Listen to your favorite stories! Enjoy reading fun and colorful stories',
    ),
    OnBoardingModel(
      title: 'Read and Practice',
      image: 'assets/images/on_boarding_2.png',
      description: 'Listen to your favorite stories! Enjoy reading fun and colorful stories',
    ),
    OnBoardingModel(
      title: 'Learn and Enjoy',
      image: 'assets/images/on_boarding_3.png',
      description: 'Listen to your favorite stories! Enjoy reading fun and colorful stories',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }


  void onNextPressed() {
    if(currentIndex.value == 2){
      // pSetRout(page: ()=> const LoginView(), routeType: RouteType.pushReplace);
      pSetRout(page: ()=> const LoginView());
    }else{
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void onPageChange(int value) {
    currentIndex.value = value;
  }
}

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({required this.image, required this.title, required this.description});
}
