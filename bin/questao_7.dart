import 'dart:io';
import 'dart:math';

void main() {
  print('--- Cálculo da Série SY ---');
  print('Informe o número de termos que deseja calcular:');
  int n = int.parse(stdin.readLineSync()!);
  print('Informe o valor de X:');
  double x = double.parse(stdin.readLineSync()!);

  double s = 0;
  int fatAtual = 1;
  int direcao = 1;

  for (int i = 1; i <= n; i++) {
    double fat = 1;
    for (int j = 1; j <= fatAtual; j++) {
      fat *= j;
    }

    s += pow(x, i + 1) / fat;

    if (fatAtual == 4) {
      direcao = -1;
    } else if (fatAtual == 1) {
      direcao = 1;
    }
    fatAtual += direcao;
  }

  print('\nO valor final calculado para a série SY é: $s');
}
