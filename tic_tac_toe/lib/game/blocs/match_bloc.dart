import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';

part 'match_state.dart';

class MatchBloc extends Cubit<MatchState> {
  MatchBloc() : super(MatchStateOngoing(MatchModel()));

  void gameFinished(Player? whoWon) {
    if (whoWon != null) {
      state.match.points[whoWon] = (state.match.points[whoWon] ?? 0) + 1;
    } else {
      state.match.points.forEach((key, value) {
        value += 0.5;
      });
    }
    emit(state);
  }

  void newGame() {
    state.match.games.add(GameModel(size: state.match.boardSize));
    emit(state);
  }
}
