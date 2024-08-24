import 'package:flutter/material.dart';

import '../model/JogoDaVelha.dart';

class Celula extends StatefulWidget {
  final JogoDaVelha jogo;
  final int posicao;
  _CelulaState state = _CelulaState();

  Celula({required this.jogo, required this.posicao});

  @override
  _CelulaState createState() {
    return state;
  }
}

class _CelulaState extends State<Celula> {
  reset() {
    setState(() => buildContent());
  }

  buildContent() {
    return Text(widget.jogo.obterEstadoPosicao(posicao: widget.posicao), style: TextStyle(fontSize: 48));
  }

  _fazerJogada() {
    if (widget.jogo.jogar(posicao: widget.posicao)) {
      setState(() => buildContent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _fazerJogada,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        alignment: Alignment.center,
        child: buildContent(),
      ),
    );
  }
}
