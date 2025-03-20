import 'dart:io';

void verNota() {
  stdout.write('Digite a nota (0 a 10): ');
  var grade = double.parse(stdin.readLineSync()!);
  if (grade >= 9) {
    print('Conceito: A');
  } else if (grade >= 7) {
    print('Conceito: B');
  } else if (grade >= 5) {
    print('Conceito: C');
  } else if (grade >= 3) {
    print('Conceito: D');
  } else {
    print('Conceito: F');
  }
}