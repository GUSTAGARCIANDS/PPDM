import 'dart:io';

void main() {
  print("Digite um número para verificar se ele é primo: ");
  int numero = int.parse(stdin.readLineSync()!);

  if (isPrimo(numero)) {
    print("O número $numero é primo.");
  } else {
    print("O número $numero não é primo.");
  }
}

bool isPrimo(int num) {
  if (num <= 1) return false;
  for (int i = 2; i <= num / 2; i++) {
    if (num % i == 0) {
      return false;  // Se for divisível por algum número além de 1 e ele mesmo, não é primo.
    }
  }
  return true;  // Caso não seja divisível por nenhum número além de 1 e ele mesmo, é primo.
}