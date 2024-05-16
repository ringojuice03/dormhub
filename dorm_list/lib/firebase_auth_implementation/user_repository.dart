import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_list/firebase_auth_implementation/user_model.dart';
import 'package:dorm_list/global/common/toast.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  creatUser(UserModel user) async{
    await _db.collection('Users').add(user.toJson()).whenComplete(() => showToast(message: 'User account has been created'))
    .catchError((error, StackTrace) {
      showToast(message: 'An error occurred: ${error.code}');
    })
    ;
  }
  

}