import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/game.dart';

// ignore: non_constant_identifier_names
Icon PlayerIcon(Player? player, {double? size = 18, Color? color = Colors.white}) {
  return Icon(
    (player == Player.x)
        ? Icons.close
        : (player == Player.o)
            ? Icons.circle_outlined
            : null,
    size: size,
    color: color,
  );
}
