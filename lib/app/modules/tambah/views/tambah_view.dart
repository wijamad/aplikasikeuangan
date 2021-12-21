import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';
// import 'package:utslogin/app/routes/app_pages.dart';

import '../controllers/tambah_controller.dart';

class TambahView extends GetView<TambahController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "DOMPETKU",
            ),
            Text(
              "Pengatur Keuangan sehatku",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Text(
                "TRANSAKSI",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.left,
              )
            ],
          ),
          Container(
            // TAMBAH MARGIN
            margin: EdgeInsets.all(16.0),
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Obx(() => DropdownButton<String>(
                      hint: const Text("Pilih Jenis Transaksi"),
                      value: controller.dropdownValue.value,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 20,
                      onChanged: (String? newValue) {
                        controller.dropdownValue.value = newValue!;
                      },
                      items: <String>['Pengeluaran', 'Pemasukan']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
              ],
            ),
          ),
          // HAPUS SIZED BOX
          Row(
            children: const <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                "JUMLAH",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                textAlign: TextAlign.left,
              )
            ],
          ),
          SizedBox(
            width: 300,
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.grey, width: 1),
            //   borderRadius: BorderRadius.circular(13),
            // ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: TextField(
                    autofocus: false,
                    controller: controller.jumlah,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                      hintText: "Jumlah",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                    ),
                  ),
                ),
                // HAPUS SIZED BOX
                // TAMBAH CONTAINER
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: TextField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    controller: controller.catatan,
                    textInputAction: TextInputAction.go,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                      hintText: "Catatan",
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                    ),
                  ),
                  // HAPUS SIZED BOX
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // ELEVATED BUTTON DIWRAP PAKE COLUMN BIAR BISA ATUR WIDHT
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.newnote(
                    authC.profile.value.email!,
                  );
                  Get.back();
                },
                child: const Text('SIMPAN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  onPrimary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 5,
                  fixedSize: const Size(150, 40),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // HAPUS SIZED BOX
        ],
      ),
    );
  }
}
