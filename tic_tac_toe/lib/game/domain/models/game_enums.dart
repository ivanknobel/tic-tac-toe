import 'dart:math';

enum Player {
  x,
  o,
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

enum GameStatus {
  start,
  ongoing,
  drawn,
  xWon,
  oWon,
}
