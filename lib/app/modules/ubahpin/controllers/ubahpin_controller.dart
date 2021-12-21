import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UbahpinController extends GetxController {
  late TextEditingController ubahpin;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    ubahpin = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
