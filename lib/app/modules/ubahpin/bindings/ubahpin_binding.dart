import 'package:get/get.dart';

import '../controllers/ubahpin_controller.dart';

class UbahpinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbahpinController>(
      () => UbahpinController(),
    );
  }
}
