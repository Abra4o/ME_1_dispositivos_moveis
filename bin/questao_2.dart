import 'dart:io';
import 'dart:math';

void main() {
  print('Digite a quantidade de termos da sequência:');
  int n = int.parse(stdin.readLineSync()!);
  double s = 0;
  int numBase = 3;
  int fatBase = 4;
  int denBase = 5;

  for (int i = 1; i <= n; i++) {
    double fat = 1;
    for (int j = 1; j <= fatBase; j++) {
      fat *= j;
    }

    double termo = pow(numBase, fat) / denBase;

    if (i >= 4 && i % 2 == 0) {
      s -= termo;
    } else {
      s += termo;
    }

    numBase += 2;
    fatBase += 4;
    denBase += 5;
  }

  print('Soma dos $n termos da sequência: $s');
}
