/* O jogo agora contém a escolha de jogar em 1 ou 2 jogadores, quando jogado
 em 1 jogador não tem mudanças ao entregado para realizar a atividade, enquanto
 com 2 jogadores tem um sistema de troca por turnos para indicar quem está jogando
 por uma variável turno = 1 que sempre começa pelo jogador 1 e troca por um if caso
jogo.turno seja igual a 1, daí jogador 2 joga, e vai seguindo repetidamente este
ciclo.

Foi adicionada a variável int jogador 2 com o mesmo valor do jogador 1 e adicionada
na função exibirJogo em caso de 2 jogadores um ícone diferente para o 2 jogador,
sendo um arco.

Na função moverJogador é apenas uma réplica do jogador 1. e segue o mesmo na função atirar.

No void main foi adicionado um prêmio e mostra qual jogador venceu determinando pelo jogo.turno
 que indica se foi 1 ou 2, ou seja, o vencedor*/

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
        print("\n🎯 Jogador ${jogo.turno} acertou o alvo! Parabéns você ganhou um pastel e uma coca-cola! 🎯\n");
        break;
      } else {
        print("\n💥 Errou! Tente novamente, fracassado!\n");
      }
    } else {
      print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
    }

    if (modo == 2) {
      jogo.turno = jogo.turno == 1 ? 2 : 1;
    }
  }
}
