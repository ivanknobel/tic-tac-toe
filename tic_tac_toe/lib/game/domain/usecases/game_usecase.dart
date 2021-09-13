import 'package:tic_tac_toe/game/game.dart';

class GameUseCase {
  GameStatus getGameStatus(List<List<SquareOption>> board) {
    int size = board.length;

    bool isStart = true, isDraw = true;
    List<SquareOption> mainDiagonal = List.filled(size, SquareOption.empty),
        otherDiagonal = List.filled(size, SquareOption.empty);

    for (int i = 0; i < size; i++) {
      mainDiagonal[i] = board[i][i];
      otherDiagonal[i] = board[size - i - 1][size - i - 1];
    }

    GameStatus mainDiagonalStatus = _listStatus(mainDiagonal);
    GameStatus otherDiagonalStatus = _listStatus(otherDiagonal);
    if (mainDiagonalStatus != GameStatus.ongoing) {
      return mainDiagonalStatus;
    } else if (otherDiagonalStatus != GameStatus.ongoing) {
      return otherDiagonalStatus;
    }

    for (var row in board) {
      GameStatus rowStatus = _listStatus(row);
      if (rowStatus != GameStatus.ongoing) {
        return rowStatus;
      }
      if (!_isListEmpty(row)) {
        isStart = false;
      }
      if (!_isListFull(row)) {
        isDraw = false;
      }
    }

    for (int i = 0; i < size; i++) {
      List<SquareOption> column = List.filled(size, SquareOption.empty);
      for (int j = 0; j < size; j++) {
        column[j] = board[i][j];
      }
      GameStatus columnStatus = _listStatus(column);
      if (columnStatus != GameStatus.ongoing) {
        return columnStatus;
      }
      if (!_isListEmpty(column)) {
        isStart = false;
      }
      if (!_isListFull(column)) {
        isDraw = false;
      }
    }

    if (isStart) {
      return GameStatus.start;
    }
    if (isDraw) {
      return GameStatus.drawn;
    }

    return GameStatus.ongoing;
  }

  Player nextPlayer({required Player lastPlayed}) {
    if (lastPlayed == Player.x) {
      return Player.o;
    }
    return Player.x;
  }

  GameStatus _listStatus(List<SquareOption> list) {
    if (list.every((element) => element == SquareOption.x)) {
      return GameStatus.xWon;
    } else if (list.every((element) => element == SquareOption.o)) {
      return GameStatus.oWon;
    }
    return GameStatus.ongoing;
  }

  bool _isListEmpty(List<SquareOption> list) {
    if (list.contains(SquareOption.x) || list.contains(SquareOption.o)) {
      return false;
    }
    return true;
  }

  bool _isListFull(List<SquareOption> list) {
    if (list.contains(SquareOption.empty)) {
      return false;
    }
    return true;
  }
}
