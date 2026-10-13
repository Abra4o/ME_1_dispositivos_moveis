import 'dart:io';

List<int> lerVetor(int numero) {
  int tamanho;
  do {
    stdout.write('Tamanho do vetor $numero: ');
    tamanho = int.parse(stdin.readLineSync()!.trim());
    if (tamanho <= 0) {
      print('O tamanho deve ser maior que zero.');
    }
  } while (tamanho <= 0);

  List<int> vetor = [];
  for (int i = 0; i < tamanho; i++) {
    stdout.write('Vetor $numero [${i + 1}]: ');
    vetor.add(int.parse(stdin.readLineSync()!.trim()));
  }
  print('');
  return vetor;
}

bool contem(List<int> vetor, int valor) {
  for (int i = 0; i < vetor.length; i++) {
    if (vetor[i] == valor) return true;
  }
  return false;
}

List<int> ordenar(List<int> vetor) {
  List<int> copia = List<int>.from(vetor);
  for (int i = 1; i < copia.length; i++) {
    int chave = copia[i];
    int j = i - 1;
    while (j >= 0 && copia[j] > chave) {
      copia[j + 1] = copia[j];
      j--;
    }
    copia[j + 1] = chave;
  }
  return copia;
}

void main() {
  List<List<int>> vetores = [];
  for (int k = 1; k <= 4; k++) {
    vetores.add(lerVetor(k));
  }

  List<int> todos = [];
  for (int k = 0; k < 4; k++) {
    for (int i = 0; i < vetores[k].length; i++) {
      todos.add(vetores[k][i]);
    }
  }
  List<int> quinto = ordenar(todos);

  List<int> intersecao = [];
  for (int i = 0; i < vetores[0].length; i++) {
    int valor = vetores[0][i];
    if (contem(intersecao, valor)) continue;

    bool emTodos = true;
    for (int k = 1; k < 4; k++) {
      if (!contem(vetores[k], valor)) {
        emTodos = false;
        break;
      }
    }

    if (emTodos) {
      intersecao.add(valor);
    }
  }
  intersecao = ordenar(intersecao);

  for (int k = 0; k < 4; k++) {
    print('Vetor ${k + 1}: ${vetores[k]}');
  }
  print('');
  print('a) Quinto vetor (todos os valores ordenados): $quinto');

  if (intersecao.isEmpty) {
    print('b) Não há elementos comuns aos 4 vetores');
  } else {
    print('b) Interseção dos 4 vetores: $intersecao');
  }
}
