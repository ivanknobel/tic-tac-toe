import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Jogar",
              style: textTheme.headline5!.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            MainButton(
              text: "2 Jogadores",
              action: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NormalGamePage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
