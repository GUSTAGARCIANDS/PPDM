import 'dart:io';

void tabuada() {
  stdout.write('Digite um número: ');
  var number = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= 10; i++) {
    print('$number x $i = ${number * i}');
  }
}