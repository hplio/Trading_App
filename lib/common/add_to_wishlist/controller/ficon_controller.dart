import 'dart:convert';

import 'package:get/get.dart';
import 'package:trading_app/local_storage/storage_utility.dart';

class FIconController extends GetxController {
  static FIconController get insatnce => Get.find();
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  void initFavorites() {
    final json = KLocalStorage().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String stockId) {
    return favorites[stockId] ?? false;
  }

  void toggleFavouriteStock(String stockId) {
    final encodedFavorites = json.encode('favorites');
    KLocalStorage().saveData('favorites', encodedFavorites);
  }

}
