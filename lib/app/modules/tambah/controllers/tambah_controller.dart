import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TambahController extends GetxController {
  final dropdownValue = 'Pengeluaran'.obs;
  final dropdownKategori = 'Makanan'.obs;

  late TextEditingController jumlah;
  late TextEditingController catatan;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void newnote(
    String email,
  ) async {
    CollectionReference users = firestore.collection("users");
    DateTime date = DateTime.now();

    final currUser = await users.doc(email).get();
    final currUserData = currUser.data() as Map<String, dynamic>;

    await users.doc(email).update({
      "${dropdownValue}": currUserData[dropdownValue] + int.parse(jumlah.text)
    });

    await users.doc(email).collection("note").add({
      "kategori": dropdownKategori.string,
      "value": dropdownValue.string,
      "jumlah": jumlah.text,
      "catatan": catatan.text,
      "groupTime": date
    });
  }

  @override
  void onInit() {
    super.onInit();
    jumlah = TextEditingController();
    catatan = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
