import 'package:flutter/material.dart';
import 'package:tune_app/models.dart';
import 'package:tune_app/reusable_components.dart';

class TuneScreen extends StatelessWidget {
  TuneScreen({Key? key}) : super(key: key);

  List<TuneModel> listTune = [
    TuneModel(color: Colors.black, sound: ''),
    TuneModel(color: Colors.brown, sound: ''),
    TuneModel(color: Colors.red, sound: ''),
    TuneModel(color: Colors.blueAccent, sound: ''),
    TuneModel(color: Colors.tealAccent, sound: ''),
    TuneModel(color: Colors.green, sound: ''),
    TuneModel(color: Colors.deepPurple, sound: ''),
    TuneModel(color: Colors.white30, sound: ''),
    TuneModel(color: Colors.pinkAccent, sound: ''),
    TuneModel(color: Colors.deepOrangeAccent, sound: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Flutter TuneApp',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
          children: listTune.map((e) => TuneWidget(tuneModel: e)).toList()
          //getListColorWidgets(),
          ),
    );
  }

  // List<ColorWidget> getListColorWidgets() {
  //   List<ColorWidget> list_colorWidgets = [];
  //   for (int i = 0; i < listColor.length; i++) {
  //     list_colorWidgets.add(ColorWidget(colorModel: listColor[i]));
  //   }
  //   return list_colorWidgets;
  // }
}
