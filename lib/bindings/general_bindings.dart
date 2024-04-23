import 'package:get/get.dart';
import 'package:trading_app/network/network_manager.dart';

class GenralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
