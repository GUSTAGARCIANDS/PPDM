import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroAleatorio = random.nextInt(100) + 1;  // Número aleatório entre 1 e 100
  int palpite;
  int tentativas = 0;

  print("Bem-vindo ao jogo da adivinhação!");
  print("Tente adivinhar o número entre 1 e 100.");

  do {
    print("Digite o seu palpite: ");
    palpite = int.parse(stdin.readLineSync()!);
    tentativas++;

    if (palpite < numeroAleatorio) {
      print("O número é maior.");
    } else if (palpite > numeroAleatorio) {
      print("O número é menor.");
    } else {
      print("Parabéns! Você acertou o número em $tentativas tentativas!");
    }
  } while (palpite != numeroAleatorio);
}