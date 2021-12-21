import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PendaftaranController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController nameController;
  late TextEditingController pinController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passController = TextEditingController();
    nameController = TextEditingController();
    pinController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
