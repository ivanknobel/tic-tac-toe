import 'package:tic_tac_toe/game/game.dart';

class GameUseCase {
  GameStatus getGameStatusFromBoard(List<List<SquareOption>> board) {
    return GameStatus.draw;
  }
}
