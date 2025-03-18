void main() {
  int numero = 10;
  int soma = 0;
  int i = 1;

  while (i <= numero) {
    soma += i;
    i++;
  }

  print("A soma de todos os números de 1 até $numero é: $soma");
}