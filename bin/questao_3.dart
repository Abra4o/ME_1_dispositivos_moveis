import 'dart:io';

void main() {
  print('Digite a quantidade de números que deseja imprimir:');
  int n = int.parse(stdin.readLineSync()!);
  int a = 5;
  int b = 100;
  int c = 2;

  for (int i = 0; i < n; i++) {
    if (i % 3 == 0) {
      print(a);
      a += 5;
    } else if (i % 3 == 1) {
      print(b);
      b -= 10;
    } else {
      print(c);
      c *= 2;
    }
  }

  print('Os valores acima são os $n números solicitados da sequência.');
}
