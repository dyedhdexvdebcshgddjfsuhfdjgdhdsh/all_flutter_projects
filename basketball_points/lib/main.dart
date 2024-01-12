import 'package:flutter/material.dart';

void main() {
  runApp(const Basketball());
}

class Basketball extends StatefulWidget {
  const Basketball({Key? key}) : super(key: key);

  @override
  State<Basketball> createState() => _BasketballState();
}

class _BasketballState extends State<Basketball> {
  int team_A_Point = 0;
  int team_B_Point = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Basketball Points'),
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "images/background.png",
                        ),
                        fit: BoxFit.fill)),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Team A',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.white),
                          ),
                          Text(
                            '$team_A_Point',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 150,
                                color: Colors.white),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (team_A_Point < 100) {
                                  ++team_A_Point;
                                }
                              });
                            },
                            child: Text(
                              'Add 1 point',
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(100, 45)),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (team_A_Point < 100) {
                                  team_A_Point += 2;
                                }
                              });
                            },
                            child: Text('Add 2 point',
                                style: TextStyle(fontSize: 20)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(100, 45)),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (team_A_Point < 100) {
                                  team_A_Point += 3;
                                }
                              });
                            },
                            child: Text('Add 3 point',
                                style: TextStyle(fontSize: 20)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(100, 45)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                          indent: 20,
                          endIndent: 15,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Team B',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.white),
                          ),
                          Text(
                            '$team_B_Point',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 150,
                                color: Colors.white),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (team_B_Point <= 100) {
                                  ++team_B_Point;
                                }
                              });
                            },
                            child: Text(
                              'Add 1 point',
                              style: TextStyle(fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(100, 45)),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                team_B_Point += 2;
                              });
                            },
                            child: Text('Add 2 point',
                                style: TextStyle(fontSize: 20)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(100, 45)),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (team_B_Point <= 100) {
                                  team_B_Point += 3;
                                }
                              });
                            },
                            child: Text('Add 3 point',
                                style: TextStyle(fontSize: 20)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: Size(100, 45)),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          team_A_Point = 0;
                          team_B_Point = 0;
                        });
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 10,
                          minimumSize: Size(30, 50)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
