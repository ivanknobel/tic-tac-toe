import 'package:tic_tac_toe/game/game.dart';

class GameModel {
  final int size;
  late var board = List.generate(
      size, (i) => List.generate(size, (i) => SquareOption.empty),
      growable: false);

  GameModel({this.size = 3});

  @override
  String toString() {
    String str = "";
    for (var row in board) {
      for (var element in row) {
        if (element == SquareOption.x) {
          str += "x";
        } else if (element == SquareOption.o) {
          str += "o";
        } else {
          str += "_";
        }
      }
    }
    return str;
  }
}
