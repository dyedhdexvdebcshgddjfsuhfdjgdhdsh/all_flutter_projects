import 'package:flutter/material.dart';
import 'package:nabalsi2app/homepage.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {required this.icon,
      required this.onPressed,
      this.iconColor,
      this.buttonColor});
  final IconData icon;
  final onPressed;
  final iconColor;
  final buttonColor;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: buttonColor,
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.colour,
      required this.title,
      required this.onPressed,
      required this.textColor,
      this.buttonIcon,
      required this.iconColor});
  final Color colour;
  final Color textColor;
  final Color iconColor;
  final String title;
  final Function onPressed;
  final buttonIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Icon(
                buttonIcon,
                color: iconColor,
              ),
            ),
            MaterialButton(
              onPressed: () {
                onPressed();
              },
              minWidth: 1000.0,
              height: 42.0,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Playfair',
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showLoading(context) {
  Future.delayed(Duration(milliseconds: 500), () {
    Navigator.of(context).pushReplacementNamed(HomePage.id);
  });
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Please Wait........."),
          content: Container(
              height: 50, child: Center(child: CircularProgressIndicator())),
        );
      });
}
