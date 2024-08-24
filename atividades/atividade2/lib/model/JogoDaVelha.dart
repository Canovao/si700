import 'package:atividade2/view/Celula.dart';
import 'package:atividade2/view/WinLabel.dart';

class JogoDaVelha {
  List<Celula>? celulas;
  WinLabel winLabel;

  JogoDaVelha(this.winLabel) {
    celulas = [
      Celula(jogo: this, posicao: 0),
      Celula(jogo: this, posicao: 1),
      Celula(jogo: this, posicao: 2),
      Celula(jogo: this, posicao: 3),
      Celula(jogo: this, posicao: 4),
      Celula(jogo: this, posicao: 5),
      Celula(jogo: this, posicao: 6),
      Celula(jogo: this, posicao: 7),
      Celula(jogo: this, posicao: 8),
    ];
  }

  Map<int, String> _valorPosicao = {0: "", 1: "X", -1: "O"};

  List<int> tabuleiro = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  // 0: vazio
  // 1: X
  // -1: O

  int _actualPlayer = 1; // 1 ou -1

  bool finished_game = false;

  jogar({required int posicao}) {
    if (finished_game) {
      return false;
    }

    if (tabuleiro[posicao] == 0) {
      tabuleiro[posicao] = _actualPlayer;
      change_player();
      return true;
    } else {
      return false;
    }
  }

  obterEstadoPosicao({required int posicao}) {
    return _valorPosicao[tabuleiro[posicao]];
  }

  change_player() {
    _actualPlayer = (_actualPlayer == 1) ? -1 : 1;

    List<List<int>> linesBoard = [
      [tabuleiro[0], tabuleiro[1], tabuleiro[2]],
      [tabuleiro[3], tabuleiro[4], tabuleiro[5]],
      [tabuleiro[6], tabuleiro[7], tabuleiro[8]]
    ];

    List<List<int>> columnsBoard = [
      [tabuleiro[0], tabuleiro[3], tabuleiro[6]],
      [tabuleiro[1], tabuleiro[4], tabuleiro[7]],
      [tabuleiro[2], tabuleiro[5], tabuleiro[8]]
    ];

    List<List<int>> xBoard = [
      [tabuleiro[0], tabuleiro[4], tabuleiro[8]],
      [tabuleiro[6], tabuleiro[4], tabuleiro[2]]
    ];

    [linesBoard, columnsBoard, xBoard].forEach( (matriz) => 
      matriz.forEach( (line) =>
        finish_game(line[0] + line[1] + line[2])
      )
    );

    if (!finished_game) {
      bool hasEmpty = false;
      for (var i = 0; i < tabuleiro.length; i++) {
        if (tabuleiro[i] == 0) {
          hasEmpty = true;
          break;
        }
      }

      if (!hasEmpty) {
        winLabel.createState().changeText("Empate !");
        finished_game = true;
      }
    }
  }

  finish_game(sum) {
    if (sum == 3) {
      // X
      winLabel.createState().changeText("(X) Ganhou !");
      finished_game = true;
    }

    if (sum == -3) {
      // O
      winLabel.createState().changeText("(O) Ganhou !");
      finished_game = true;
    }
  }

  restart() {
    tabuleiro = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    finished_game = false;
    _actualPlayer = 1;
    winLabel.createState().changeText("");

    celulas!.forEach((element) {
      element.createState().reset();
    });
  }

}
