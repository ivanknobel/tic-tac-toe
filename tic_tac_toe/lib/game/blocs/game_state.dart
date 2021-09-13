part of 'game_bloc.dart';

abstract class GameState {
  GameModel game;

  GameState(this.game);

  List<List<SquareOption>> get board => game.board;
}

class GameStateStart extends GameState {
  final Player whoPlays;

  GameStateStart(GameModel game, {required this.whoPlays}) : super(game);
}

class GameStateOngoing extends GameState {
  final Player whoPlays;

  GameStateOngoing(GameModel game, {required this.whoPlays}) : super(game);
}

class GameStateFinished extends GameState {
  final GameStatus result;

  GameStateFinished(GameModel game, {required this.result}) : super(game);
}
