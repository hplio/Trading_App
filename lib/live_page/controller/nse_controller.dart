import 'package:get/get.dart';

class NSEController extends GetxController {
  static NSEController get instance => Get.find();
  final rsiVisible = false.obs;
  final adVisible = false.obs;
  final atrVisible = false.obs;
  final smaVisible = false.obs;
  final emaVisible = false.obs;
  final macdVisible = false.obs;
  final stochasticVisible = false.obs;
  final tmaVisible = false.obs;

  void changeVale(String? value) {
    adVisible.value = false;
    rsiVisible.value = false;
    atrVisible.value = false;
    emaVisible.value = false;
    macdVisible.value = false;
    smaVisible.value = false;
    stochasticVisible.value = false;
    tmaVisible.value = false;
    if (value == 'AD') {
      adVisible.value = !adVisible.value;
    } else if (value == 'RSI') {
      rsiVisible.value = !rsiVisible.value;
    } else if (value == 'ATR') {
      atrVisible.value = !atrVisible.value;
    } else if (value == 'EMA') {
      emaVisible.value = !emaVisible.value;
    } else if (value == 'MACD') {
      macdVisible.value = !macdVisible.value;
    } else if (value == 'SMA') {
      smaVisible.value = !smaVisible.value;
    } else if (value == 'Stochastic') {
      stochasticVisible.value = !stochasticVisible.value;
    } else if (value == 'TMA') {
      tmaVisible.value = !tmaVisible.value;
    }
  }
}
