import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';
import 'package:utslogin/app/data/SignInSignUpResult.dart';
import 'package:utslogin/app/routes/app_pages.dart';

import '../controllers/pendaftaran_controller.dart';

class PendaftaranView extends GetView<PendaftaranController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  // Tulisa Hello
                  Row(
                    children: <Widget>[
                      Text(
                        "Hello.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
// Tulisan Welcome back
                  Text(
                    "Welcome back",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 36,
                        letterSpacing: 5),
                  ),
// Spasi
                  SizedBox(height: 40),
// Form username & password
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "nama",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.nameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "nama",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                          ),
                        ),
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: controller.passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                          ),
                        ),
                        Text(
                          "Setting Pin (5 angka)",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          maxLength: 5,
                          controller: controller.pinController,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "buat pin baru",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                SignInSignUpResult result =
                                    await authC.createUser(
                                  email: controller.emailController.text,
                                  pass: controller.passController.text,
                                  name: controller.nameController.text,
                                  pin: controller.pinController.text,
                                );
                                if (result.user != null) {
                                  print(result.user);
                                  _snackBar(
                                      "Pendaftaran bershail", "silahkan login");
                                  Get.toNamed(Routes.LOGIN);
                                } else {
                                  _snackBar("pendaftaran gagal",
                                      "ada yang salah datamu");
                                }
                              },
                              child: Text(
                                "Singup",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  primary: Color(0xFF4f4f4f)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "have account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _snackBar(String tulisan, String tulisan2) {
    Get.snackbar(tulisan, tulisan2,
        animationDuration: const Duration(milliseconds: 200));
  }
}
