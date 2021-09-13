import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/theme/colors.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    GameBloc _bloc = BlocProvider.of<GameBloc>(context);

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
                  onPressed: (state is GameStateStart)
                      ? () {
                          _bloc.play(
                            player: state.whoPlays,
                            row: x,
                            column: y,
                          );
                          setState(() {});
                        }
                      : (state is GameStateOngoing)
                          ? () {
                              _bloc.play(
                                player: state.whoPlays,
                                row: x,
                                column: y,
                              );
                              setState(() {});
                            }
                          : null,
                );
              },
            )
          ],
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _gameSquare({required SquareOption data, VoidCallback? onPressed}) {
    String item = "nada";
    if (data == SquareOption.x) {
      item = "X";
    } else if (data == SquareOption.o) {
      item = "O";
    }

    return GestureDetector(
      onTap: (data == SquareOption.empty) ? onPressed : null,
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: CustomColors.gold,
              width: 0.5,
            ),
          ),
          child: Center(child: Text(item, style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}
