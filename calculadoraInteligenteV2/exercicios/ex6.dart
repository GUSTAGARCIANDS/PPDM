import 'dart:io';

void contagemProgressiva() {
  stdout.write('Digite um número: ');
  var max = int.parse(stdin.readLineSync()!);
  for (int i = 1; i <= max; i++) {
    print(i);
  }
}