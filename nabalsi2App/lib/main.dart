import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nabalsi2app/chat.dart';
import 'package:nabalsi2app/homepage.dart';
import 'package:nabalsi2app/login.dart';
import 'package:nabalsi2app/profile.dart';
import 'package:nabalsi2app/sendmessages.dart';
import 'package:nabalsi2app/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'موسوعة النابلسي',
      home: HomePage(),
      initialRoute: WelcomeScreen.id,
      routes: {
        // "welcome":(context)=>WelcomeScreen()
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomePage.id: (context) => HomePage(),
        ChatScreen.id: (context) => ChatScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        "login": (context) => LoginScreen(), "send": (context) => SendMessages()
      },
    );
  }
}
