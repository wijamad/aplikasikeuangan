import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utslogin/app/data/SignInSignUpResult.dart';
import 'package:utslogin/app/data/profil.dart';

class AuthController extends GetxController {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var profile = ProfilUser().obs;

  Future<SignInSignUpResult> createUser({
    required String email,
    required String pass,
    required String name,
    required String pin,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      User? user = result.user;
      CollectionReference users = firestore.collection("users");
      await user!.updateDisplayName(name);
      if (user.email != null) {
        users
            .doc(user.email)
            .set({"pin": pin, "Pengeluaran": 0, "Pemasukan": 0});
      }
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  Future<SignInSignUpResult> signInWithEmail(
      {required String email, required String pass}) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      profile(ProfilUser(nama: user!.displayName, email: user.email));
      profile.refresh();
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  void ubahpin(String ubahpin) {
    CollectionReference users = firestore.collection("users");
    users.doc(profile.value.email).update({
      "pin": ubahpin,
    });
  }
}
