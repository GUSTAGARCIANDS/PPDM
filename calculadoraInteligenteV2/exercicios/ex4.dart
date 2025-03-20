import 'dart:io';

void compararNumeros() {
  stdout.write('Digite o primeiro número: ');
  var num1 = double.parse(stdin.readLineSync()!);
  stdout.write('Digite o segundo número: ');
  var num2 = double.parse(stdin.readLineSync()!);
  if (num1 > num2) {
    print('$num1 é maior que $num2');
  } else if (num1 < num2) {
    print('$num1 é menor que $num2');
  } else {
    print('$num1 é igual a $num2');
  }
}