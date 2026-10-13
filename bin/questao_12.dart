import 'dart:io';

void main() {
  stdout.write('Digite um número: ');
  int numero = int.parse(stdin.readLineSync()!.trim());

  int resto = numero.abs();
  String invertido = '';

  if (resto == 0) {
    invertido = '0';
  }

  while (resto > 0) {
    invertido += (resto % 10).toString();
    resto ~/= 10;
  }

  if (numero < 0) {
    invertido = '-$invertido';
  }

  print('Impressão: $invertido');
}
