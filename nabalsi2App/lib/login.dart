import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nabalsi2app/components.dart';
import 'package:nabalsi2app/google_signin.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final AuthMethods authMethods = AuthMethods();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/NabulsiRounded.png",
              scale: 5,
            ),
            Text(
              "موسوعة النابلسي",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Expanded(child: SizedBox()),
            Text(
              "Login with : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RoundedButton(
                  iconColor: Colors.white,
                  title: "Google",
                  onPressed: () async {
                    try {
                      bool result = await authMethods.signinWithgoogle();
                      if (result) {
                        await showLoading(context);
                        //   Navigator.of(context).pushReplacementNamed(HomePage.id);
                      }
                      //  return await AuthService().signWithGoogle();
                    } catch (error) {}
                  },
                  colour: Colors.redAccent,
                  textColor: Colors.white,
                  buttonIcon: FontAwesomeIcons.google),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RoundedButton(
                  iconColor: Colors.white,
                  title: "Apple",
                  onPressed: () {},
                  colour: Colors.redAccent,
                  textColor: Colors.white,
                  buttonIcon: FontAwesomeIcons.apple),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RoundedButton(
                  iconColor: Colors.white,
                  title: "Phone",
                  onPressed: () {},
                  colour: Colors.redAccent,
                  textColor: Colors.white,
                  buttonIcon: FontAwesomeIcons.phone),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
