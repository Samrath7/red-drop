import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:red_drop/screen/home.dart';

import 'donate_with_friends2.dart';

class Donate_with_Friends extends StatefulWidget {
  const Donate_with_Friends({super.key});

  @override
  State<Donate_with_Friends> createState() => _Donate_with_FriendsState();
}

class _Donate_with_FriendsState extends State<Donate_with_Friends> {
  final _userStream =
      FirebaseFirestore.instance.collection('Friends').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 7, 7),
        title: const Text('Donate with your Friends'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: StreamBuilder(
        stream: _userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Connection Error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          var docs = snapshot.data!.docs;
          // return Text('${docs.length}');

          return Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      )
                    ]),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Donate_With_Friends2()));
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${docs[index]['Image']}',
                        ),
                        radius: 25,
                      ),
                      title: Text(docs[index]['Name'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'inriaSans')),
                      subtitle: Text('${docs[index]['Blood_Group']}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'inriaSans')),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 219, 7, 7)),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
