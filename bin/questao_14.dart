import 'dart:io';

List<int> lerVetor(String nome) {
  int tamanho;
  do {
    stdout.write('Tamanho do vetor $nome: ');
    tamanho = int.parse(stdin.readLineSync()!.trim());
    if (tamanho <= 0) {
      print('O tamanho deve ser maior que zero.');
    }
  } while (tamanho <= 0);

  List<int> vetor = [];
  for (int i = 0; i < tamanho; i++) {
    while (true) {
      stdout.write('$nome[${i + 1}]: ');
      int valor = int.parse(stdin.readLineSync()!.trim());
      if (i > 0 && valor < vetor[i - 1]) {
        print(
          'O vetor deve estar ordenado. Digite um valor >= ${vetor[i - 1]}.',
        );
        continue;
      }
      vetor.add(valor);
      break;
    }
  }
  return vetor;
}

void main() {
  List<int> a = lerVetor('A');
  print('');
  List<int> b = lerVetor('B');

  List<int> c = [];
  int i = 0;
  int j = 0;

  while (i < a.length && j < b.length) {
    if (a[i] <= b[j]) {
      c.add(a[i]);
      i++;
    } else {
      c.add(b[j]);
      j++;
    }
  }

  while (i < a.length) {
    c.add(a[i]);
    i++;
  }

  while (j < b.length) {
    c.add(b[j]);
    j++;
  }

  print('');
  print('Vetor A: $a');
  print('Vetor B: $b');
  print('Vetor C (ordenado): $c');
}
