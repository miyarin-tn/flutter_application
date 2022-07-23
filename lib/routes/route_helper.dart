import 'package:flutter_application/pages/food/popular_food_detail.dart';
import 'package:flutter_application/pages/food/recommended_food_detail.dart';
import 'package:flutter_application/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => initial;
  static String getPopularFood(int id) => '$popularFood?id=$id';
  static String getRecommendedFood(int id) => '$recommendedFood?id=$id';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () {
        var id = Get.parameters['id'];
        return PopularFoodDetail(id: int.parse(id!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var id = Get.parameters['id'];
        return RecommendedFoodDetail(id: int.parse(id!));
      },
    ),
  ];
}
