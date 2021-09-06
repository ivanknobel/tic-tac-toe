import 'package:tic_tac_toe/game/game.dart';

class GameModel {
  final int size;
  late var squares = List.generate(size, (i) => List.generate(size, (i) => SquareOptions.empty), growable: false);

  GameModel({this.size = 3});

  
}
