import 'package:c_s/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'modules/splash/splash_view.dart';

double deviceHeight = Get.height;
double deviceWidth = Get.width;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  pSetSettings(
    primaryColor: Clr.colorPrimary,
    secondaryColor: Clr.colorSecondary,
    btnRadius: 10,
    txtInputLabelPadding: 8,
    txtInputHasLabelWithStar: false,
    btnBgColor: Clr.colorPrimary,
    defaultImage: 'assets/images/on_boarding_2.png',
    txtInoutDefaultContentPadding: const EdgeInsets.all(16),
    defaultImageClick: false,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Clr.colorWhite,
        primaryColor: Clr.colorPrimary,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Clr.colorSecondary, primary: Clr.colorPrimary,),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}

