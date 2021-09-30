import 'dart:math';

enum Player {
  x,
  o,
}

String getPlayerName(Player player) {
  if (player == Player.x) {
    return "X";
  }
  return "O";
}

Player getRandomStarter() {
  bool xPlays = Random().nextBool();
  return xPlays ? Player.x : Player.o;
}

enum SquareOption {
  empty,
  x,
  o,
}

SquareOption squareOptionFromPlayer(Player player) {
  if (player == Player.x) {
    return SquareOption.x;
  }
  return SquareOption.o;
}

Player? playerFromSquareOption(SquareOption squareOption) {
  if (squareOption == SquareOption.x) {
    return Player.x;
  }
  if (squareOption == SquareOption.o) {
    return Player.o;
  }
  return null;
}

enum GameStatus {
  start,
  ongoing,
  drawn,
  xWon,
  oWon,
}

Player? getWinnerFromResult(GameStatus result) {
  if (result == GameStatus.xWon) {
    return Player.x;
  }
  if (result == GameStatus.oWon) {
    return Player.o;
  }
  return null;
}
