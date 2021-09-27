import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/constants/constants.dart';
import 'package:tic_tac_toe/game/game.dart';
import 'package:tic_tac_toe/widgets/widgets.dart';

class GameSettingsTab extends StatefulWidget {
  const GameSettingsTab({Key? key}) : super(key: key);

  @override
  _GameSettingsTabState createState() => _GameSettingsTabState();
}

class _GameSettingsTabState extends State<GameSettingsTab> {
  late MatchBloc _matchBloc;
  late ThemeData _theme;
  int gameSize = 3;
  Player? starter;

  @override
  Widget build(BuildContext context) {
    _matchBloc = BlocProvider.of<MatchBloc>(context);
    _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _settingsItem(Strings.labelSizeSelector, _sizePicker()),
          _settingsItem(Strings.labelWhoStarts, _starterPicker()),
          MainButton(
            text: Strings.buttonPlay,
            action: () {
              _matchBloc.start(size: gameSize, starter: starter);
            },
          )
        ],
      ),
    );
  }

  Widget _sizePicker() {
    return Expanded(
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
    );
  }

  Widget _starterPicker() {
    List<Player?> possibleStarters = [null, Player.x, Player.o];
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DropdownButton(
        underline: Container(
          height: 2,
          color: _theme.primaryColor,
        ),
        iconEnabledColor: _theme.primaryColor,
        value: starter,
        items: possibleStarters.map(
          (Player? player) {
            return DropdownMenuItem(
              alignment: Alignment.center,
              value: player,
              child: Center(
                child: (player == null)
                    ? const Text(
                        Strings.randomPlayer,
                      )
                    : PlayerIcon(player,
                        color: _theme.textSelectionTheme.selectionColor),
              ),
            );
          },
        ).toList(),
        selectedItemBuilder: (context) {
          return possibleStarters.map<Widget>(
            (Player? player) {
              return DropdownMenuItem(
              alignment: Alignment.center,
              value: player,
              child: Align(
                alignment: Alignment.centerRight,
                child: (player == null)
                    ? Text(
                        Strings.randomPlayer,
                        style: _theme.textTheme.bodyText1,
                      )
                    : PlayerIcon(player,
                        color: _theme.iconTheme.color,),
              ),
            );
            },
          ).toList();
        },
        onChanged: (Player? newValue) {
          starter = newValue;
          setState(() {});
        },
      ),
    );
  }

  Widget _settingsItem(String label, Widget selector) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: _theme.textTheme.bodyText1,
          ),
          flex: 1,
        ),
        selector
      ],
    );
  }
}
