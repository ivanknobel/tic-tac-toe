import 'package:tic_tac_toe/game/game.dart';

class GameModel {
  final int size;
  final Player? starter;
  late var board = List.generate(
      size, (i) => List.generate(size, (i) => SquareOption.empty),
      growable: false);
  Player? winner;

  GameModel({this.size = 3, this.starter});
}
