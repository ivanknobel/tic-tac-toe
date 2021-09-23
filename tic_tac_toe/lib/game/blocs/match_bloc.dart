import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';

part 'match_state.dart';

class MatchBloc extends Cubit<MatchState> {
  MatchBloc() : super(MatchStateSettings(MatchModel()));

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
    MatchState newState = MatchStateNewGame(state.match);
    newState.match.games.add(GameModel(size: state.match.boardSize));
    emit(newState);
  }

  void start({int size = 3}) {
    MatchModel match = MatchModel(boardSize: size);
    MatchState newState = MatchStateOngoing(match);
    emit(newState);
  }
}
