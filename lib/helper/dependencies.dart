import 'package:flutter_application/controllers/popular_product_controller.dart';
import 'package:flutter_application/data/api/api_client.dart';
import 'package:flutter_application/data/repository/popular_product_repo.dart';
import 'package:flutter_application/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
