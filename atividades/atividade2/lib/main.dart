import 'package:atividade2/view/WinLabel.dart';
import 'package:flutter/material.dart';

import 'model/JogoDaVelha.dart';

void main() {
  WinLabel label = WinLabel();
  JogoDaVelha jogo = JogoDaVelha(label);
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: const Text('Jogo da Velha')),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          children: jogo.celulas!,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        label,
        ElevatedButton(
          onPressed: () => jogo.restart(),
          child: const Text("Reiniciar")
        )
      ],
    ),
  )));
}
