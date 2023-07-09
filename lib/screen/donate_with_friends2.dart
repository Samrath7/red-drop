import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapis/firestore/v1beta1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:red_drop/screen/home.dart';
import 'donate_with_friends2.dart';

class Donate_With_Friends2 extends StatefulWidget {
  const Donate_With_Friends2({super.key});

  @override
  State<Donate_With_Friends2> createState() => _Donate_With_Friends2State();
}

class _Donate_With_Friends2State extends State<Donate_With_Friends2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 7, 7),
        title: const Text('Donate Together'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'You & Mathew',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'inriaSans',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Image(
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA2GyrNw0347riU47VUSbSTCAe52XUjQbsmg&usqp=CAU',
              ),
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    width: 2,
                  )),
                ),
                child: const Text(
                  'Donated 0 Times Together',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50,
                ),
                CircleAvatar(
                  radius: 50,
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Name',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Name',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Blood Group',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Blood Group',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: const Text(
                  'Invite to Donate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
