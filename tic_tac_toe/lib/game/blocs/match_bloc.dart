import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';

part 'match_state.dart';

class MatchBloc extends Cubit<MatchState> {
  MatchBloc() : super(MatchStateSettings(MatchModel(colors: GameConstants.defaultColors)));

  void gameFinished(Player? whoWon) {
    MatchState newState = MatchStateGameFinished(state.match);
    if (whoWon != null) {
      newState.match.points[whoWon] = (newState.match.points[whoWon] ?? 0) + 1;
    } else {
      newState.match.points[Player.x] =
          (newState.match.points[Player.x] ?? 0) + 0.5;
      newState.match.points[Player.o] =
          (newState.match.points[Player.o] ?? 0) + 0.5;
    }
    emit(newState);
  }

  void newGame() {
    MatchModel match = state.match;
    MatchState newState = MatchStateNewGame(match);
    newState.match.games.add(GameModel(size: match.boardSize, colors: match.colors));
    emit(newState);
  }

  void start({int size = 3, Player? starter, required Map<Player, Color> colors}) {
    MatchModel match = MatchModel(boardSize: size, starter: starter, colors:colors);
    MatchState newState = MatchStateOngoing(match);
    emit(newState);
  }
}
