import 'dart:io';

int lerTamanho() {
  int tamanho;
  do {
    stdout.write('Tamanho dos vetores: ');
    tamanho = int.parse(stdin.readLineSync()!.trim());
    if (tamanho <= 0) {
      print('O tamanho deve ser maior que zero.');
    }
  } while (tamanho <= 0);
  return tamanho;
}

List<int> lerVetor(String nome, int tamanho) {
  List<int> vetor = [];
  for (int i = 0; i < tamanho; i++) {
    stdout.write('$nome[${i + 1}]: ');
    vetor.add(int.parse(stdin.readLineSync()!.trim()));
  }
  print('');
  return vetor;
}

List<int> somarVetores(List<int> a, List<int> b) {
  List<int> resultado = [];
  for (int i = 0; i < a.length; i++) {
    resultado.add(a[i] + b[i]);
  }
  return resultado;
}

int somarElementos(List<int> vetor) {
  int total = 0;
  for (int i = 0; i < vetor.length; i++) {
    total += vetor[i];
  }
  return total;
}

void imprimirVetor(String nome, List<int> vetor) {
  print('$nome: $vetor');
}

void main() {
  int tamanho = lerTamanho();
  print('');

  List<int> a = lerVetor('A', tamanho);
  List<int> b = lerVetor('B', tamanho);

  List<int> c = somarVetores(a, b);
  int total = somarElementos(c);

  imprimirVetor('Vetor A', a);
  imprimirVetor('Vetor B', b);
  imprimirVetor('Vetor C (A + B)', c);
  print('Soma de todos os elementos de C: $total');
}
