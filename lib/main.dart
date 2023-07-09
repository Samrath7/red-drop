import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red_drop/screen/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:red_drop/screen/login.dart';
import 'package:red_drop/screen/news.dart';
import 'package:red_drop/screen/profile.dart';
import 'package:red_drop/screen/selection.dart';
import 'package:red_drop/screen/sign-up.dart';
import 'package:red_drop/screen/start_page.dart';
import 'screen/chat.dart';
import 'screen/donate_with_friends.dart';
import 'screen/donate_with_friends2.dart';
import 'screen/order_tracking.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: startpage(),
    );
  }
}
