import 'dart:io';

void calculadoraRetangulo() {
  stdout.write('Digite a largura do retângulo: ');
  var width = double.parse(stdin.readLineSync()!);
  stdout.write('Digite a altura do retângulo: ');
  var height = double.parse(stdin.readLineSync()!);
  var area = width * height;
  print('A área do retângulo é: $area');
}