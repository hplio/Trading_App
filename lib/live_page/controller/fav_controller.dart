import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trading_app/common/loader/loader.dart';

class FavIcon extends GetxController {
  static FavIcon get instance => Get.find();

  final stockId = <String>[].obs;
  final stockName = <String>[].obs;
  final nasdaqStockId = <String>[].obs;
  final nasdaqStockName = <String>[].obs;
  // final isFav = false.obs;

  final stockL = List.generate(20, (index) => false).obs;
  final nasdaqStockL = List.generate(20, (index) => false).obs;

  void addStockIdAndName(String stockkId, String stockkName) {
    if (stockName.contains(stockkName)) {
      stockId.remove(stockkId);
      stockName.remove(stockkName);
      KLoader.customToast(massage: 'Removed from your wishlist.');
      return;
    }
    stockId.add(stockkId);
    stockName.add(stockkName);
    KLoader.customToast(massage: 'Added to your wishlist.');
    if (kDebugMode) {
      print("stockId:$stockkId");
      print("stockName:$stockName");
    }
  }

  void addNasdaqIdAndName(String stockkId, String stockkName) {
    if (nasdaqStockId.contains(stockkId)) {
      nasdaqStockId.remove(stockkId);
      nasdaqStockName.remove(stockkName);
      KLoader.customToast(massage: 'Removed from your wishlist.');
      return;
    }
    nasdaqStockId.add(stockkId);
    nasdaqStockName.add(stockkName);
    KLoader.customToast(massage: 'Added to your wishlist.');
    if (kDebugMode) {
      print("stockId:$stockkId");
      print("stockName:$stockName");
    }
  }
}
