import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TuneModel {
  Color color;
  String sound;
  TuneModel({required this.color, required this.sound});
  playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource(sound)); // will immediately start playing
  }
}
