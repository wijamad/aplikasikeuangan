import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.00,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://pro2-bar-s3-cdn-cf.myportfolio.com/591d04f256aa901b6f95d035a778faaa/b58ee850-08a3-482f-9d7f-88f2ab6236cf_rw_1200.png?h=87b7e6ed5e1aef17d1c886c73ab4af0f'),
              ),
              SizedBox(
                height: 15,
              ),
              Text("${authC.profile.value.nama}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("${authC.profile.value.email}"),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("08512345678"),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Rumah"),
                      ),
                      Divider(
                        height: 1,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 18,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
