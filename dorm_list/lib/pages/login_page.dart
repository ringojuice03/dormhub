import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorm_list/components/registration_textfield.dart';
import 'package:dorm_list/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:dorm_list/global/common/toast.dart';
import 'package:dorm_list/pages/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  FirebaseAuthService _auth = FirebaseAuthService();

  bool _isSigning = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 103),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Login
                Text('Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 48)),
                const SizedBox(height: 34),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // // first name
                    // RegistrationTextField(
                    //   hintText: 'First Name',
                    //   controller: firstNameController,
                    //   obscureText: false,
                    // ),

                    // // surname
                    // RegistrationTextField(
                    //   hintText: 'Surname',
                    //   controller: surnameController,
                    //   obscureText: false,
                    // ),

                    // // username
                    // RegistrationTextField(
                    //   hintText: 'Username',
                    //   controller: usernameController,
                    //   obscureText: false,
                    // ),

                    // email
                    RegistrationTextField(
                      hintText: 'Email',
                      controller: emailController,
                      obscureText: false,
                    ),

                    // password
                    RegistrationTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),

                    // sign up button
                    const SizedBox(height: 30),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF474747),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        _login();
                      },
                      child: Center(
                        child: _isSigning ? 
                        SizedBox(height: 20, width: 20,child: CircularProgressIndicator(color: Colors.white,)) :
                        Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Registration()), (route) => false);
                          },
                          child: Text('Sign Up', 
                            style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15)),
                        )
                      ],
                    ),
                    const SizedBox(height: 77)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _login() async {

    setState(() {
      _isSigning = true;
    });

    String email = emailController.text;
    String password = passwordController.text;
    final _db = FirebaseFirestore.instance;
    CollectionReference users = _db.collection('Users');

    QuerySnapshot querySnapshot = await users.where('Email', isEqualTo: email).where('Password', isEqualTo: password).get();
    
    setState(() {
      _isSigning = false;
    });

    if (querySnapshot.docs.isNotEmpty) {
      showToast(message: 'User is successfully signed in');
      Navigator.pushNamed(context, "/homepage");
    }
    else {
      showToast(message: 'User not found');
    }
  }
}