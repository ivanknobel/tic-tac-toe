import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late GameBloc _bloc;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<GameBloc>(context);
    theme = Theme.of(context);

    return BlocConsumer(
      bloc: _bloc,
      builder: (context, GameState state) {
        int size = state.game.size;

        return Stack(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: size,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: size * size,
              itemBuilder: (context, index) {
                int length = size;
                int x, y = 0;
                x = (index / length).floor();
                y = (index % length);

                return _gameSquare(
                  data: state.game.board[x][y],
                  whoPlays: (state is GameStateStart)
                      ? state.whoPlays
                      : (state is GameStateOngoing)
                          ? state.whoPlays
                          : null,
                  x: x,
                  y: y,
                  gameSize: size,
                );
              },
            )
          ],
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _gameSquare({
    required SquareOption data,
    Player? whoPlays,
    required int x,
    required int y,
    required int gameSize,
  }) {
    return GestureDetector(
      onTap: (data == SquareOption.empty && whoPlays != null)
          ? () {
              _bloc.play(player: whoPlays, row: x, column: y);
            }
          : null,
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(border: _getSquareBorder(x, y, gameSize)),
          child: Center(child: _getIcon(data)),
        ),
      ),
    );
  }

  Icon _getIcon(SquareOption data) {
    return Icon(
      (data == SquareOption.x)
          ? Icons.close
          : (data == SquareOption.o)
              ? Icons.circle_outlined
              : null,
    );
  }

  Border _getSquareBorder(int x, int y, int max) {
    return Border(
      top: (x != 0) ? _squareBorderSide() : const BorderSide(width: 0),
      left: (y != 0) ? _squareBorderSide() : const BorderSide(width: 0),
      bottom: (x != max - 1) ? _squareBorderSide() : const BorderSide(width: 0),
      right: (y != max - 1) ? _squareBorderSide() : const BorderSide(width: 0),
    );
  }

  BorderSide _squareBorderSide() {
    return BorderSide(
      color: theme.primaryColor,
      width: 1,
    );
  }
}
