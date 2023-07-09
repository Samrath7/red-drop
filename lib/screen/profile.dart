import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:red_drop/screen/home.dart';
import '../utils/colors.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined,
                        color: hexStringToColor('DF1B1B'), size: 40),
                  ),
                  const Text('Profile',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'inriaSans',
                        fontWeight: FontWeight.bold,
                      )),
                  const Text(''),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/profile.jpg"),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: const Color(0xFFF5F6F9),
                              padding: const EdgeInsets.all(15.0),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.female,
                                color: Color.fromARGB(255, 219, 7, 7),
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Samrath Ansar',
                    style: TextStyle(
                      fontFamily: 'inriaSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shadowColor: Colors.grey,
              ),
              label: const Text(
                'Available to Donate',
                style: TextStyle(color: Colors.black),
              ),
              icon: const Icon(
                Icons.toggle_on,
                color: Color.fromARGB(255, 219, 7, 7),
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: Colors.grey,
                      ),
                      label: const Text(
                        'Life Saved',
                        style: TextStyle(color: Colors.black),
                      ),
                      
                      icon: const Icon(
                        Icons.toggle_on,
                        color: Color.fromARGB(255, 219, 7, 7),
                      ),
                    ),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
