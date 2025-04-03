import 'dart:io';
import 'dart:math';

class JogoTiro {
  final int largura = 20;
  late int alvo;
  int jogador1 = 10;
  int jogador2 = 10;
  int turno = 1;

  JogoTiro() {
    alvo = Random().nextInt(largura);
  }

  void exibirJogo() {
    for (int i = 0; i < largura; i++) {
      if (i == jogador1 && i == jogador2) {
        stdout.write('🤺');
      } else if (i == jogador1) {
        stdout.write('🔫');
      } else if (i == jogador2) {
        stdout.write('🏹');
      } else if (i == alvo) {
        stdout.write('🎯');
      } else {
        stdout.write('-');
      }
    }
    print('');
  }

  void moverJogador(String direcao, int jogador) {
    if (jogador == 1) {
      if (direcao == 'a' && jogador1 > 0) jogador1--;
      if (direcao == 'd' && jogador1 < largura - 1) jogador1++;
    } else {
      if (direcao == 'a' && jogador2 > 0) jogador2--;
      if (direcao == 'd' && jogador2 < largura - 1) jogador2++;
    }
  }

  bool atirar(int jogador) {
    if ((jogador == 1 && jogador1 == alvo) ||
        (jogador == 2 && jogador2 == alvo)) {
      return true;
    }
    return false;
  }
}

void main() {
  JogoTiro jogo = JogoTiro();
  String? comando;
  int modo = 1;

  print("\n=== JOGO DE TIRO ===");
  print("Escolha o modo de jogo:");
  print("1 - Um jogador");
  print("2 - Dois jogadores");

  stdout.write("Opção: ");
  modo = int.tryParse(stdin.readLineSync() ?? '1') ?? 1;

  print("\nUse 'a' para esquerda, 'd' para direita e 'f' para atirar!\n");

  while (true) {
    jogo.exibirJogo();
    print("\n🎮 Turno do Jogador ${jogo.turno}");

    stdout.write("Comando: ");
    comando = stdin.readLineSync();

    if (comando == 'a' || comando == 'd') {
      jogo.moverJogador(comando!, jogo.turno);
    } else if (comando == 'f') {
      if (jogo.atirar(jogo.turno)) {
        print("\n🎯 Jogador ${jogo.turno} acertou o alvo! Parabéns! 🎯\n");
        break;
      } else {
        print("\n💥 Errou! Tente novamente.\n");
      }
    } else {
      print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
    }

    if (modo == 2) {
      jogo.turno = jogo.turno == 1 ? 2 : 1;
    }
  }
}
