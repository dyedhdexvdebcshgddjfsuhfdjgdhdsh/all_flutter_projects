import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nabalsi2app/components.dart';
import 'package:nabalsi2app/homepage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const id = "welcomescreen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () async {
      FirebaseAuth authuser = FirebaseAuth.instance;
      if (authuser.currentUser != null) {
        await showLoading(context);
        Navigator.of(context).pushReplacementNamed(HomePage.id);
      } else {
        Navigator.of(context).pushReplacementNamed("login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
        child: Scaffold(
          body: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: size.width * 0.3,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: size.width * 0.3,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/top_right.png",
                    width: size.width * 0.3,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/bottom_right.png",
                    width: size.width * 0.3,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/NabulsiRounded.png",
                          width: size.width * 0.7,
                        ),
                      ),
                      Text(
                        "موسوعة النابلسي",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
