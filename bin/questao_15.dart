import 'dart:io';

void main() {
  int n;
  do {
    stdout.write('Quantidade de bois: ');
    n = int.parse(stdin.readLineSync()!.trim());
    if (n <= 0) {
      print('A quantidade deve ser maior que zero.');
    }
  } while (n <= 0);

  List<int> numeros = [];
  List<double> pesos = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Número do boi ${i + 1}: ');
    numeros.add(int.parse(stdin.readLineSync()!.trim()));

    stdout.write('Peso do boi ${i + 1} (kg): ');
    pesos.add(double.parse(stdin.readLineSync()!.trim().replaceAll(',', '.')));
  }

  String continuar;
  do {
    print('');
    stdout.write('Peso mínimo: ');
    double minimo = double.parse(
      stdin.readLineSync()!.trim().replaceAll(',', '.'),
    );

    stdout.write('Peso máximo: ');
    double maximo = double.parse(
      stdin.readLineSync()!.trim().replaceAll(',', '.'),
    );

    if (minimo > maximo) {
      double temp = minimo;
      minimo = maximo;
      maximo = temp;
    }

    print('');
    print(
      'Bois com peso entre ${minimo.toStringAsFixed(2)} kg e ${maximo.toStringAsFixed(2)} kg:',
    );

    int encontrados = 0;
    for (int i = 0; i < n; i++) {
      if (pesos[i] >= minimo && pesos[i] <= maximo) {
        print('Boi nº ${numeros[i]} - ${pesos[i].toStringAsFixed(2)} kg');
        encontrados++;
      }
    }

    if (encontrados == 0) {
      print('Nenhum boi encontrado nesse intervalo.');
    } else {
      print('Total encontrado: $encontrados');
    }

    print('');
    stdout.write('Deseja fazer outra pesquisa? (S/N): ');
    continuar = stdin.readLineSync()!.trim().toUpperCase();
  } while (continuar == 'S');
}
