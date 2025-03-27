//Dupla: Gustavo Garcia e Kaiki Santos

import 'dart:io';
import 'dart:math';

class JogoTiro {
  final int largura = 20;
  late int alvo;
  int jogador1 = 10;
  int jogador2 = 10;
  bool turnoJogador = true; //Responsável no modo de dupla por alternar os jogadores

  JogoTiro() {
    alvo = Random().nextInt(largura);
  }

  void exibirJogo() {
    for (int i = 0; i < largura; i++) {
      if (i == jogador1) {
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

  void moverJogador(String direcao) {
    if (turnoJogador) {      //Usa o turnoJogador para mover o jogador 1 pois ele será de início true, resumindo sempre mexendo o jogador 1 independente do modo
      if (direcao == 'a' && jogador1 > 0) {
        jogador1--;
      } else if (direcao == 'd' && jogador1 < largura - 1) {
        jogador1++;
      }
    } else {      //Usa o else para fazer o turnoJogador inverter para mover o jogador 2
      if (direcao == 'a' && jogador2 > 0) {
        jogador2--;
      } else if (direcao == 'd' && jogador2 < largura - 1) {
        jogador2++;
      }
    }
  }

  bool atirar() {
    if (turnoJogador) {         //Alterna conforme a função mudarJogador, se turnoJogador ser true será o jogador 1, senão vai ser o jogador 2
      return jogador1 == alvo;
    } else {
      return jogador2 == alvo;
    }
  }

  void mudarJogador() {               //Essa função irá alterar o jogador conforme você faz os movimentos
    turnoJogador = !turnoJogador;     //Ele faz o resultado do turnoJogador inicialmente true, mudar pra false e trocar o jogador como na função moverJogador
  }
}

void main() {
  JogoTiro jogo = JogoTiro();
  String? comando;    //String? Dá a opção da resposta ser String quanto null
  String? escolha;    //A opção escolha pra escolher qual modo será, 1 jogador ou 2 jogadores

  print("\n=== JOGO DE TIRO ===");
  print("Use 'a' para esquerda, 'd' para direita e 'f' para atirar!\n");
  print("Escolha como quer jogar: ");
  print("1) 1 Jogador");
  print("2) 2 Jogadores");
  stdout.write("Digite sua escolha (1 ou 2): ");
  escolha = stdin.readLineSync(); //Ele pega a resposta do usuário pra qual modo de jogo vai jogar e leva pro if else

  if (escolha == '1') {                     //If else, se a escolha for 1 você jogará sozinho, se digitar 2 vai jogar em dupla,
    print("\nVocê está no modo solo");      //senão vai digitar novamente até igual 1 ou 2, senão irá se repetir infinitamente
  } else if (escolha == '2') {
    print("\nVocê está no modo de dupla");
  } else {
    print("Escolha inválida, escolha novamente");
    return;
  }

  while (true) {
    jogo.exibirJogo();

    stdout.write("Comando: ");
    comando = stdin.readLineSync();

    if (comando == 'a' || comando == 'd') {
      jogo.moverJogador(comando!);
    } else if (comando == 'f') {
      if (jogo.atirar()) {
        print("\n🎯 Você acertou o alvo! Parabéns! 🎯\n");
        break;
      } else {
        print("\n💥 Errou! Tente novamente.\n");
      }
    } else {
      print("\nComando inválido! Use 'a', 'd' ou 'f'.\n");
    }
  }
}