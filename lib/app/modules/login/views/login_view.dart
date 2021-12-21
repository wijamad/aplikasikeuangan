import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';
import 'package:utslogin/app/data/SignInSignUpResult.dart';
import 'package:utslogin/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.put(AuthController(), permanent: true);
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
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                SignInSignUpResult result =
                                    await authC.signInWithEmail(
                                        email: controller.emailController.text,
                                        pass: controller.passController.text);
                                if (result.user != null) {
                                  _snackBar(
                                      "Login Berhasil", "Masukkan pin anda");
                                  Get.toNamed(Routes.PIN);
                                } else {
                                  _snackBar("Login gagal",
                                      "email atau password salah");
                                }
                              },
                              child: Text(
                                "Login",
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
                        "Don\'t have account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PENDAFTARAN);
                        },
                        child: Text(
                          "Register here",
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
