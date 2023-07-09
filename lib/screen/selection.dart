import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_drop/screen/login.dart';
import 'package:red_drop/utils/colors.dart';
import 'dart:math' as math;

import 'sign-up.dart';

class selection extends StatefulWidget {
  const selection({super.key});

  @override
  State<selection> createState() => _selectionState();
}

class _selectionState extends State<selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset('assets/image/logo.jpeg'),
              Text(
                'Welcome',
                style: GoogleFonts.dancingScript(
                  fontSize: 75,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'to',
                style: GoogleFonts.dancingScript(
                  fontSize: 75,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Red Drop',
                style: GoogleFonts.dancingScript(
                  fontSize: 75,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 100,
                width: 100,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(

                      // padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(250, 60),
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      elevation: 15,
                      shadowColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: const StadiumBorder()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      thickness: 2,
                      color: Colors.grey,
                      height: 50,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 20.0,
                      thickness: 2,
                      color: Colors.grey,
                      height: 70,
                    ),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const signup()));
                  },
                  child: const Text(
                    "Sign - up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(250, 60),
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      elevation: 15,
                      shadowColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: const StadiumBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
