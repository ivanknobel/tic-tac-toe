import 'package:tic_tac_toe/game/game.dart';

class MatchModel {
  final int boardSize;
  final Player? starter;

  late List<GameModel> games;

  Map<Player, double> points = {
    Player.x: 0,
    Player.o: 0,
  };

  MatchModel({this.boardSize = 3, this.starter}) {
    games = List.of(
      [GameModel(size: boardSize, starter: starter)],
      growable: true,
    );
  }
}
