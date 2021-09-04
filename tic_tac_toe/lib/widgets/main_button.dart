import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? action;

  const MainButton({Key? key, required this.text, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: action,
      child: Text(text),
    );
  }
}
