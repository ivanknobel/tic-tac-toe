import 'dart:ui';
import 'package:tic_tac_toe/game/game.dart';

class MatchModel {
  final int boardSize;
  final Player? starter;
  final Map<Player, Color> colors;

  late List<GameModel> games;

  Map<Player, double> points = {
    Player.x: 0,
    Player.o: 0,
  };

  MatchModel({this.boardSize = GameConstants.defaultGameSize, this.starter, required this.colors}) {
    games = List.of(
      [GameModel(size: boardSize, starter: starter, colors: colors)],
      growable: true,
    );
  }
}
