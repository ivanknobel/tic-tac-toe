import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? action;

  const MainButton({Key? key, required this.text, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: action,
      child: Text(
        text,
        style: theme.textTheme.bodyText1,
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return theme.textSelectionTheme.selectionColor;
            }
            return theme.textTheme.bodyText1?.color ?? Colors.grey;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return theme.primaryColor;
            }
            return theme.backgroundColor;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
