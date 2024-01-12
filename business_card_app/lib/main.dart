import 'package:flutter/material.dart';

void main() {
  runApp(Business());
}

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xFF274460),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 112,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 110,
                            backgroundImage: AssetImage('images/ahmed2.png')),
                      ),
                      Text(
                        'Ahmed Assem Soliman',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Oswald',
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Flutter Developer',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Divider(
                        color: Colors.white70,
                        height: 20,
                        thickness: 2,
                        indent: 40,
                        endIndent: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 60,
                          width: 320,
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 30,
                                color: Color(0xFF274460),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '(20+): 01122614875',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          height: 60,
                          width: 320,
                          child: Row(
                            children: [
                              Icon(
                                Icons.email_rounded,
                                size: 30,
                                color: Color(0xFF274460),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'ahmedasam3000@gmail.com',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
