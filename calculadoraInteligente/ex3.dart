import 'dart:io';

void parImpar() {
  stdout.write('Digite um número: ');
  var number = int.parse(stdin.readLineSync()!);
  if (number % 2 == 0) {
    print('$number é par.');
  } else {
    print('$number é ímpar.');
  }
}