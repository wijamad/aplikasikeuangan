import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';
import 'package:utslogin/app/data/drawer.dart';

import '../controllers/ubahpin_controller.dart';

class UbahpinView extends GetView<UbahpinController> {
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
      drawer: Mydrawer(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              maxLength: 5,
              autofocus: false,
              controller: controller.ubahpin,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.go,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                hintText: "5 angka",
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  authC.ubahpin(
                    controller.ubahpin.text,
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
        ],
      ),
    );
  }
}
