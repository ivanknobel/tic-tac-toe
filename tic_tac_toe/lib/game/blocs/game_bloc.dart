import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/injection.dart';
import 'package:tic_tac_toe/game/game.dart';

part 'game_state.dart';

class GameBloc extends Cubit<GameState> {
  final GameModel game;

  GameBloc(this.game) : super(GameStateStart(game, whoPlays: getRandomStarter()));

  final _useCase = locator.get<GameUseCase>();

  void play({
    required Player player,
    required int row,
    required int column,
  }) {
    if (state.board[row][column] == SquareOption.empty) {
      state.board[row][column] = squareOptionFromPlayer(player);

      final Player next = _useCase.nextPlayer(lastPlayed: player);
      final GameStatus status = _useCase.getGameStatus(state.game.board);
      final GameModel game = state.game;
      GameState newState = state;

      switch (status) {
        case GameStatus.start:
          newState = GameStateOngoing(game, whoPlays: next);
          break;
        case GameStatus.ongoing:
          newState = GameStateOngoing(game, whoPlays: next);
          break;
        case GameStatus.drawn:
        case GameStatus.xWon:
        case GameStatus.oWon:
          newState = GameStateFinished(game, result: status);
          break;
      }
      emit(newState);
    }
  }

  void newGame(GameModel game) {
    GameState newState =
        GameStateStart(game, whoPlays: getRandomStarter());
    emit(newState);
  }
}
