import 'package:tic_tac_toe/game/game.dart';

class MatchModel {
  final int boardSize;
  List<GameModel> games = List.of(
    [GameModel()],
    growable: true,
  );
  Map<Player, double> points = {
    Player.x: 0,
    Player.o: 0,
  };

  MatchModel({this.boardSize = 3});
}
