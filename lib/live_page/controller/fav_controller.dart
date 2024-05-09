import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FavIcon extends GetxController {
  static FavIcon get instance => Get.find();

  final stockId = <String>[].obs;
  final stockName = <String>[].obs;
  final isFav = false.obs;

  void addStockIdAndName(String stockkId, String stockkName) {
    stockId.add(stockkId);
    stockName.add(stockkName);
    if (kDebugMode) {
      print("stockId:$stockkId");
      print("stockName:$stockName");
    }
  }
}
