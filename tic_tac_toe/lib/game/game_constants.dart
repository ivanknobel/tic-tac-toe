import 'dart:ui';
import 'package:flutter/material.dart';
import 'game.dart';

class GameConstants {
  static const int defaultGameSize = 3;
  static const int gameSizeMin = 3;
  static const int gameSizeMax = 7;

  static const Map<Player, Color> defaultColors = {
    Player.x: Colors.white,
    Player.o: Colors.white,
  };
}
