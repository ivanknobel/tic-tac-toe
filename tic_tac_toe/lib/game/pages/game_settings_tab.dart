import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/widgets/main_button.dart';

class GameSettingsTab extends StatefulWidget {
  const GameSettingsTab({Key? key}) : super(key: key);

  @override
  _GameSettingsTabState createState() => _GameSettingsTabState();
}

class _GameSettingsTabState extends State<GameSettingsTab> {
  late MatchBloc _matchBloc;
  late ThemeData _theme;
  int gameSize = 3;

  @override
  Widget build(BuildContext context) {
    _matchBloc = BlocProvider.of<MatchBloc>(context);
    _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _sizePicker(),
          MainButton(
            text: Strings.buttonPlay,
            action: () {
              _matchBloc.start(size: gameSize);
            },
          )
        ],
      ),
    );
  }

  Widget _sizePicker() {
    return Row(
      children: [
        Expanded(
          child: Text(
            Strings.sizeSelectorLabel,
            style: _theme.textTheme.bodyText1,
          ),
          flex: 1,
        ),
        Expanded(
          child: Slider(
            activeColor: _theme.primaryColor,
            value: gameSize.toDouble(),
            onChanged: (newValue) {
              gameSize = newValue.toInt();
              setState(() {});
            },
            divisions: GameConstants.gameSizeMax - GameConstants.gameSizeMin,
            min: GameConstants.gameSizeMin.toDouble(),
            max: GameConstants.gameSizeMax.toDouble(),
            label: "$gameSize",
          ),
          flex: 2,
        ),
      ],
    );
  }
}
