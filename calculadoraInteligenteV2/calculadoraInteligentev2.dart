import 'dart:io';
import 'exercicios/barrel.dart';

void menu() {

  while (true) {
    print('''Menu da Calculadora:
    1️) Exibir "Olá, Dart!
    2️) Calcular a área de um retângulo
    3️) Verificar se um número é par ou ímpar
    4️) Comparar dois números
    5️) Converter nota para conceito
    6️) Exibir contagem progressiva
    7️) Somar todos os números até um valor especificado
    8️) Exibir a tabuada de um número
    9️) Sair do programa
    ''');

    void main(){
      int escolha;

      do{
        menu();
        stdout.write('Escolha uma opção: ');
        escolha = int.parse(stdin.readLineSync()!);

        print("");

      switch (escolha) {
        case 1: olaDart(); break;
        case 2: areaRetangulo(); break;
        case 3: parImpar(); break;
        case 4: compararNumeros(); break;
        case 5: nota(); break;
        case 6: contagemProgressiva(); break;
        case 7: soma(); break;
        case 8: tabuada(); break;
        default: print('Opção Inválida! Tente novamente.');
        } 
      } while(escolha != 9);
    }
  }
}