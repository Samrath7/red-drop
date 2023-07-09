import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_drop/screen/news.dart';
import '../../utils/colors.dart';
import 'dart:math' as math;

class startpage extends StatefulWidget {
  const startpage({super.key});

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {
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
              Text(
                'Welcome',
                style: GoogleFonts.dancingScript(
                  fontSize: 80,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'to',
                style: GoogleFonts.dancingScript(
                  fontSize: 80,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Red Drop',
                style: GoogleFonts.dancingScript(
                  fontSize: 80,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => News()));
                  },
                  style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(300, 60),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black,
                      elevation: 15,
                      shadowColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Let's Get Started",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
