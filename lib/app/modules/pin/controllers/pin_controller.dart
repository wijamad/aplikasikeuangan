import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PinController extends GetxController {
  late TextEditingController pinPutController;
  late FocusNode pinPutFocusNode;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  void onInit() {
    super.onInit();
    pinPutController = TextEditingController();
    pinPutFocusNode = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
