import 'dart:io';

void main() {
  print('--- Contador de Frequência ---');
  print('Informe a quantidade de números que deseja inserir na lista:');
  int n = int.parse(stdin.readLineSync()!);

  Map<int, int> contagem = {};
  List<int> ordem = [];

  print('Digite os $n números, um por linha:');
  for (int i = 0; i < n; i++) {
    int num = int.parse(stdin.readLineSync()!);
    if (!contagem.containsKey(num)) {
      ordem.add(num);
      contagem[num] = 1;
    } else {
      contagem[num] = contagem[num]! + 1;
    }
  }

  print('\nResultado - Elementos e as suas repetições:');
  for (int num in ordem) {
    print('$num repete-se ${contagem[num]} vez(es)');
  }
}
