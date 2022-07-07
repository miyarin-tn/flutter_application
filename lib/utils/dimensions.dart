import 'package:get/get.dart';

class Dimensions {
  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;

  static double width10 = screenWidth / 39.3;
  static double width15 = screenWidth / 26.2;
  static double width20 = screenWidth / 19.6;
  static double width25 = screenWidth / 15.7;
  static double width30 = screenWidth / 13.1;
  static double width45 = screenWidth / 8.7;

  static double height10 = screenHeight / 76;
  static double height15 = screenHeight / 50.7;
  static double height20 = screenHeight / 38;
  static double height25 = screenHeight / 30.4;
  static double height30 = screenHeight / 25.3;
  static double height45 = screenHeight / 16.9;

  static double radius20 = screenWidth / 19.6;
  static double radius30 = screenWidth / 13.1;

  static double iconSize24 = screenWidth / 16.4;

  static double pageView = screenHeight / 2.38;
  static double pageViewContainer = screenHeight / 3.45;
  static double pageViewTextContainer = screenHeight / 6.33;
}
