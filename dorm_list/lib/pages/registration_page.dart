import 'package:dorm_list/components/registration_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> _selectFromGallery() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _selectUsingCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  final firstNameController = TextEditingController();
  final surnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                // sign up
                Text('Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800, fontSize: 48)),
                const SizedBox(height: 34),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // profile picture
                    Center(
                      child: Column(
                        children: [
                          imageProfile(context),
                          const Text('Profile Picture'),
                        ],
                      ),
                    ),

                    // first name
                    RegistrationTextField(
                      hintText: 'First Name',
                      controller: firstNameController,
                      obscureText: false,
                    ),

                    // surname
                    RegistrationTextField(
                      hintText: 'Surname',
                      controller: surnameController,
                      obscureText: false,
                    ),

                    // username
                    RegistrationTextField(
                      hintText: 'Username',
                      controller: usernameController,
                      obscureText: false,
                    ),

                    // password
                    RegistrationTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),

                    // confirm password
                    RegistrationTextField(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController,
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
                      onPressed: () {},
                      child: Text('Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18)),
                    ),

                    // or
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        const SizedBox(width: 10),
                        Text('or',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(width: 10),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // sign up with google
                    OutlinedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svgs/google.svg'),
                          const SizedBox(width: 8.5),
                          Text('Sign up with Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 77),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Material(
      borderRadius:
          BorderRadius.circular(10.0), // Adjust the border radius as needed
      elevation: 4.0,
      child: Container(
        height: 120.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text('Choose profile photo',
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    _selectUsingCamera();
                  },
                  icon: const Icon(Icons.camera, color: Color(0xFF474747)),
                  label: Text('Camera',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w800)),
                ),
                TextButton.icon(
                  onPressed: () {
                    _selectFromGallery();
                  },
                  icon: const Icon(Icons.image, color: Color(0xFF474747)),
                  label: Text('Gallery',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _image == null
              ? const AssetImage('assets/images/initial.png') as ImageProvider
              : FileImage(File(_image!.path)),
        ),
        Positioned(
          bottom: -2.0,
          right: -2.0,
          child: InkWell(
              borderRadius: BorderRadius.circular(40.0),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: const Icon(
                Icons.add_circle,
                color: Color(0xFF474747),
                size: 30,
              )),
        ),
      ],
    );
  }
}
