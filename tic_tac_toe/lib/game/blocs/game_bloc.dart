import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';

part 'game_state.dart';

class GameBloc extends Cubit<GameState> {
  GameBloc() : super(GameStateStart(GameModel(), whoPlays: getRandomStarter()));

  void play({
    required Player player,
    required int row,
    required int column,
  }) {
    if (state.board[row][column] == SquareOption.empty) {
      state.board[row][column] == squareOptionFromPlayer(player);
      emit(GameStateOngoing(state.game, whoPlays: nextPlayer(player)));
    }
  }
}
