import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/settings/settings.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              Strings.titlePlay,
              style: textTheme.headline1,
            ),
            const SizedBox(
              height: 16,
            ),
            MainButton(
              text: Strings.buttonTwoPlayers,
              action: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NormalGamePage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
