import 'package:flutter/material.dart';
import 'package:tune_app/models.dart';

class TuneWidget extends StatelessWidget {
  late final TuneModel tuneModel;
  TuneWidget({Key? key, required this.tuneModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          tuneModel.playSound();
        },
        child: Container(
          // width: double.infinity,
          // height: 80,
          color: tuneModel.color,
        ),
      ),
    );
  }
}
