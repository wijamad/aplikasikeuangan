import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/routes/app_pages.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(color: Colors.blue),
              child: Stack(
                children: const [
                  Positioned(
                      bottom: 12.0,
                      left: 16.0,
                      child: Text(
                        "Menu",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              )),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.offAndToNamed(Routes.HOME);
            },
          ),
          ListTile(
            title: const Text('Ubah Pin'),
            onTap: () {
              Get.offAndToNamed(Routes.UBAHPIN);
            },
          ),
          // NAMBAH MENU PROFIL
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Get.offAndToNamed(Routes.PROFIL);
            },
          ),
        ],
      ),
    );
  }
}
