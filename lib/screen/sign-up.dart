import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_drop/screen/home.dart';
import 'package:red_drop/utils/colors.dart';
import 'dart:math' as math;
import '../services/Signupservices.dart';
import 'login.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  final formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _dobController = TextEditingController();
  final _bloodtypeController = TextEditingController();
  final _phonenumnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  hexStringToColor("241D1D"), //black color
                  hexStringToColor("5B4A4A"), //grey color
                  hexStringToColor("811C1C") //Red color
                ],
                    transform: const GradientRotation(math.pi / -7),
                    begin: Alignment.topLeft,
                    end: Alignment.topRight)),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/image/logo.png',
                          width: 100,
                          height: 75,
                        ),
                        Text(
                          'Help',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          'SIGN UP',
                          style: GoogleFonts.roboto(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Create an Account',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          'To get started now!',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintText: "Enter your Username",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Username';
                            } else if (value.length < 4) {
                              return "Too short,username should be more than 4 or more character";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _dobController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Date of Birth',
                            labelStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            hintText: "DD/MM/YYYY",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your DOB';
                            } else if (value.length < 8) {
                              return 'Should be over 18+';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _bloodtypeController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Blood type',
                            labelStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.bloodtype,
                              color: Colors.white,
                            ),
                            hintText: "Enter your Blood type",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Blood type';
                            } else {
                              return null;
                            }
                          },
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _phonenumnameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            hintText: "07X-XXX-XXXX",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone Number';
                            } else if (value.length < 10) {
                              return '10';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: "Enter your Email Address",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid Email';
                            }
                            if (value.length < 3) {
                              return 'Must be more than 7 charater';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            } else if (value.length < 8) {
                              return 'Length of Password character must be 8 or greater';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _confirmpasswordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please re-enter your password';
                            } else if (value.length < 8) {
                              return 'Length of Password character must be 8 or greater';
                            } else if (value != _passwordController.text) {
                              return "password mismatch";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // ignore: unnecessary_new
                        ElevatedButton(
                          onPressed: () async {
                            var username = _usernameController.text.trim();
                            var dob = _dobController.text.trim();
                            var bloodtype = _bloodtypeController.text.trim();
                            var phonenum = _phonenumnameController.text.trim();
                            var useremail = _emailController.text.trim();
                            var userpassword = _passwordController.text.trim();
                            var confirmpassword =
                                _confirmpasswordController.text.trim();

                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: useremail, password: userpassword)
                                .then((value) => {
                                      log("User Created"),
                                      SignupUser(
                                        username,
                                        dob,
                                        bloodtype,
                                        phonenum,
                                        useremail,
                                        userpassword,
                                        confirmpassword,
                                      ),
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home()))
                                    });
                          },
                          style: ElevatedButton.styleFrom(
                              // padding: const EdgeInsets.all(25.0),
                              fixedSize: const Size(250, 50),
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                              elevation: 15,
                              shadowColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              shape: const StadiumBorder()),
                          child: const Text(
                            "Sign-up",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),

                        Row(children: const <Widget>[
                          Expanded(
                              child: Divider(
                            color: Colors.white,
                            indent: 10,
                            endIndent: 20,
                          )),
                          Text(
                            "Have an Account already?",
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                              child: Divider(
                            color: Colors.white,
                            indent: 10,
                            endIndent: 20,
                          )),
                        ]),
                        const SizedBox(
                          height: 25,
                        ),
                        // ignore: unnecessary_new
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => login()));
                          },
                          style: ElevatedButton.styleFrom(
                              // padding: const EdgeInsets.all(25.0),
                              fixedSize: const Size(250, 50),
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                              elevation: 15,
                              shadowColor: Colors.white,
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              shape: const StadiumBorder()),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
