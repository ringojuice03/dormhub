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
                        _signIn();
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

                    // // or
                    // const SizedBox(height: 30),
                    // Row(
                    //   children: [
                    //     const Expanded(child: Divider()),
                    //     const SizedBox(width: 10),
                    //     Text('or',
                    //         style: Theme.of(context).textTheme.bodyMedium),
                    //     const SizedBox(width: 10),
                    //     const Expanded(child: Divider()),
                    //   ],
                    // ),
                    // const SizedBox(height: 30),

                    // // sign up with google
                    // OutlinedButton(
                    //   style: TextButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     minimumSize: const Size(double.infinity, 60),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15),
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       SvgPicture.asset('assets/svgs/google.svg'),
                    //       const SizedBox(width: 8.5),
                    //       Text('Sign up with Google',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodyLarge!
                    //               .copyWith(
                    //                   fontWeight: FontWeight.w300,
                    //                   fontSize: 18)),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    // SizedBox(height: 20,),
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    //print(user);
    
    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: 'User is successfully signed in');
      Navigator.pushNamed(context, "/homepage");
    } else {
      //showToast(message: 'Login error');
    }
  }
}