import 'package:flutter/material.dart';

class NormalGamePage extends StatefulWidget {

  NormalGamePage({Key? key}) : super(key: key);

  @override
  _NormalGamePageState createState() => _NormalGamePageState();
}

class _NormalGamePageState extends State<NormalGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tic Tac Toe"),),
      body: const Center(
        child: Text("JOGO"),
      ),
    );
  }
}
