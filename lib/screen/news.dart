import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:red_drop/screen/selection.dart';
import 'package:red_drop/screen/start_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/colors.dart';
import 'dart:math' as math;

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final String imagePath = 'assets/news/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/news/eligibility.png',
    'assets/news/appointment.png',
    'assets/news/hospital.png',
    'assets/news/location.png',
    'assets/news/delivery.png'
  ];

  final List<String> heading = [
    'Check Eligibility',
    'Schedule Appointment',
    'Trusted Places?',
    'Find your Donars',
    'Introducing Delivery System'
  ];

  final List<String> sub = [
    'Take a quick self-assessment test to know if you’re fit enough to donate blood by answering few simple Questions',
    'Pick a date and time that is suitable for you to donate with ease.',
    'We will be your link between you and a safe place where you donate your blood.',
    'Find your Donars and Track there Status',
    'Delivery System available for Emergency. Available 24/7'
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 18 / 8,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                carouselController: _controller,
              ),
              const SizedBox(
                height: 25.0,
                width: 500.0,
              ),
              SmoothPageIndicator(
                controller: PageController(initialPage: _current),
                count: 5,
                axisDirection: Axis.horizontal,
                effect: const ExpandingDotsEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 24.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: Colors.white,
                    activeDotColor: Colors.red),
              ),
              const SizedBox(
                height: 25.0,
                width: 500.0,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  heading[_current],
                  style: const TextStyle(
                    letterSpacing: 4,
                    decoration: TextDecoration.none,
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
                width: 200.0,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  sub[_current],
                  style: const TextStyle(
                    // letterSpacing: 4,
                    decoration: TextDecoration.none,
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
                width: 200.0,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const selection()));
                  },
                  child: const Text(
                    "Skip, Let's Go!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.all(25.0),
                      fixedSize: const Size(300, 70),
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
            ]
            ),
          )),
    );
  }
}
