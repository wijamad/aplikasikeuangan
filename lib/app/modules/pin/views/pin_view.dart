import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';
import 'package:utslogin/app/routes/app_pages.dart';

import '../controllers/pin_controller.dart';

import 'package:pinput/pin_put/pin_put.dart';

class PinView extends GetView<PinController> {
  final authC = Get.find<AuthController>();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: controller.users.doc(authC.profile.value.email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Builder(
              builder: (context) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Masukkan PIN"),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.all(20.0),
                          padding: const EdgeInsets.all(20.0),
                          child: PinPut(
                            fieldsCount: 5,
                            onSubmit: (String pin) {
                              if (pin == data["pin"]) {
                                Get.toNamed(Routes.HOME);
                              } else {
                                _snackBar();
                                controller.pinPutController.text = '';
                                controller.pinPutFocusNode.unfocus();
                              }
                            },
                            focusNode: controller.pinPutFocusNode,
                            controller: controller.pinPutController,
                            submittedFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            selectedFieldDecoration: _pinPutDecoration,
                            followingFieldDecoration:
                                _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.deepPurpleAccent.withOpacity(.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text("loading");
        },
      ),
    );
  }

  void _snackBar() {
    Get.snackbar("Password Salah", "silahkan isi ulang kembali",
        animationDuration: const Duration(milliseconds: 200));
  }
}
