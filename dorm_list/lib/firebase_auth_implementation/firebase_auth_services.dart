import 'package:dorm_list/firebase_auth_implementation/user_model.dart';
import 'package:dorm_list/firebase_auth_implementation/user_repository.dart';
import 'package:dorm_list/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';




class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final userRepo = Get.put(UserRepository());

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email is already in use.');
      }
      else {
        showToast(message: 'An error occurred: ${e.code}');
      }
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.creatUser(user);
  }
}