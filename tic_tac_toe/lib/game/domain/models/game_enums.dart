import 'dart:math';

import 'package:tic_tac_toe/game/game.dart';

enum Player {
  x,
  o,
}

Player getRandomStarter() {
  bool xPlays = Random().nextBool();
  return xPlays ? Player.x : Player.o;
}

Player nextPlayer(Player lastPlayed) {
  if (lastPlayed == Player.x) {
    return Player.o;
  }
  return Player.x;
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
  draw,
  xWon,
  oWon,
}
