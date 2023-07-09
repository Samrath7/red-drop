import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'donate.dart';
import 'guidelines.dart';
import 'histroy.dart';
import 'hospital.dart';
import 'mainhome.dart';
import 'profile.dart';
import 'selection.dart';
import 'setting.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

const String imagePath = 'assets/home/';

final CarouselController _controller = CarouselController();
int _current = 0;
final List<String> images = [
  'assets/home/donation1.jpg',
  'assets/home/donation2.jpg',
  'assets/home/donation3.jpg',
  'assets/home/donation4.jpg',
  'assets/home/donation5.jpg',
];

final List<String> heading = [
  'Check Eligibility',
  'Schedule Appointment',
  'Trusted Places?',
  'Find your Donars',
  'Introducing Delivery System'
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

final _pageOptions = [
    const mainhome(),
    const donate(),
    const hospital()
  ];


class _HomeState extends State<Home> {
  User? userId = FirebaseAuth.instance.currentUser;

  int selectedPage = 0;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 219, 7, 7),
        actions: [
          IconButton(
            onPressed: () {
              // setState(() {});
            },
            icon: Icon(Icons.notifications_none,
                color: hexStringToColor('DF1B1B'), size: 40),
          ),
        ],
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Samrath Ansar'),
              accountEmail: Text('samrath@gmail.com'),
              currentAccountPicture: CircleAvatar(
                foregroundImage: AssetImage('assets/image/profile.jpg'),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 219, 7, 7),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              hoverColor: const Color.fromARGB(255, 219, 7, 7),
              title: const Text('Profile',
                  style:
                      TextStyle(fontFamily: 'inriaSans', color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.black),
              hoverColor: const Color.fromARGB(255, 219, 7, 7),
              title: const Text('Histroy',
                  style:
                      TextStyle(fontFamily: 'inriaSans', color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const histroy()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.black),
              hoverColor: const Color.fromARGB(255, 219, 7, 7),
              title: const Text('Guidelines for \nDonation',
                  style:
                      TextStyle(fontFamily: 'inriaSans', color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const guidelines()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              hoverColor: const Color.fromARGB(255, 219, 7, 7),
              title: const Text('Setting',
                  style:
                      TextStyle(fontFamily: 'inriaSans', color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const setting()),
                );
              },
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
              indent: 25,
              endIndent: 25,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              hoverColor: const Color.fromARGB(255, 219, 7, 7),
              title: const Text('Logout',
                  style:
                      TextStyle(fontFamily: 'inriaSans', color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const selection()),
                );
              },
            ),
          ],
        ),
      ),

      

      backgroundColor: Colors.white,
      body:_pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 219, 7, 7),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPage,
          // onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bloodtype_sharp), label: 'Donate'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital), label: 'Hospital'),
          ],onTap: (index){
            setState(() {
              selectedPage = index;
            });
          },),
          
      // body: screens.elementAt(currentIndex),
    );
  }
}
