import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_drop/screen/home.dart';
import 'package:red_drop/screen/sign-up.dart';
import 'package:red_drop/utils/colors.dart';
import 'dart:math' as math;

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  final _useremailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
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
                          style: GoogleFonts.inriaSans(
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
                          'LOGIN',
                          style: GoogleFonts.inriaSans(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Welcome,',
                          style: GoogleFonts.inriaSans(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          'Glad to see you!',
                          style: GoogleFonts.inriaSans(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: _useremailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: "Enter your Email",
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
                              return 'Please enter your Email';
                            } else if (value.length < 4) {
                              return "Email should be Valid";
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

                        const SizedBox(
                          height: 25,
                        ),
                        // ignore: unnecessary_new
                        ElevatedButton(
                          onPressed: () async {
                            var loginEmail = _useremailController.text.trim();
                            var loginPassword = _passwordController.text.trim();
                            try {
                              final User? firebaseUser = (await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                          email: loginEmail,
                                          password: loginPassword))
                                  .user;
                              if (firebaseUser == null) {
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Home()));
                              }
                            } on FirebaseAuthException catch (e) {
                              print('Error $e');
                            }
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

                        Row(children: const <Widget>[
                          Expanded(
                              child: Divider(
                            color: Colors.white,
                            indent: 10,
                            endIndent: 20,
                          )),
                          Text(
                            "Don't have an Account? Sign in Now!",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'inriaSans'),
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
                                builder: (context) => const signup()));
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
                        const SizedBox(
                          height: 500,
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
