import 'dart:ui';
import 'package:tic_tac_toe/game/game.dart';

class GameModel {
  final int size;
  final Player? starter;
  final Map<Player, Color> colors;

  late var board = List.generate(
      size, (i) => List.generate(size, (i) => SquareOption.empty),
      growable: false);
  Player? winner;

  GameModel({this.size = GameConstants.defaultGameSize, this.starter, required this.colors});
}
