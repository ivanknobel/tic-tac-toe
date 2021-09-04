import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/main_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("Jogar"),
          MainButton(text: "2 Jogadores", action: (){},)
        ],
      ),
    );
  }
}
