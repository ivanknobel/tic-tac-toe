import 'package:flutter/material.dart';
import 'package:tic_tac_toe/theme/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? action;

  const MainButton({Key? key, required this.text, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.white;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return CustomColors.gold;
            }
            return Colors.black;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: CustomColors.gold,
            ),
          ),
        ),
      ),
    );
  }
}
