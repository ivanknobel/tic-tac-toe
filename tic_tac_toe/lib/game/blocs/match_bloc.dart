import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';

part 'match_state.dart';

class MatchBloc extends Cubit<MatchState> {
  MatchBloc() : super(MatchStateOngoing(MatchModel()));

  void gameFinished(Player? whoWon) {
    MatchState newState = MatchStateGameFinished(state.match);
    if (whoWon != null) {
      newState.match.points[whoWon] = (newState.match.points[whoWon] ?? 0) + 1;
    } else {
      newState.match.points.forEach((key, value) {
        value += 0.5;
      });
    }
    emit(newState);
  }

  void newGame() {
    MatchStateNewGame newState = MatchStateNewGame(state.match);
    newState.match.games.add(GameModel(size: state.match.boardSize));
    emit(newState);
  }
}
