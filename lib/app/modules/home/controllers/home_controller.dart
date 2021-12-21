import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<DocumentSnapshot> jumlahStream(String email) {
    return firestore.collection('users').doc(email).snapshots();
  }

  Stream<QuerySnapshot> data(String email) {
    return firestore
        .collection('users')
        .doc(email)
        .collection("note")
        .orderBy("groupTime", descending: true)
        .snapshots();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
