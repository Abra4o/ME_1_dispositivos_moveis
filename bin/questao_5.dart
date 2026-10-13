import 'dart:io';

void main() {
  int total = 0;
  int baixoPeso = 0;
  int normal = 0;
  int altoPeso = 0;

  double maiorPesoFem = -1;
  String nomeMaiorPesoFem = '';

  print('--- Sistema de Controle de Recém-Nascidos ---');
  print('Digite "FIM" no nome para encerrar o programa.');

  while (true) {
    print('\nInforme o Nome do recém-nascido (ou "FIM" para sair):');
    String? inputNome = stdin.readLineSync();

    // O .trim() remove espaços vazios acidentais e o toUpperCase() garante
    // que o programa encerra quer o utilizador escreva "fim", "FIM" ou "Fim".
    if (inputNome == null || inputNome.trim().toUpperCase() == 'FIM') {
      break;
    }

    String nome = inputNome.trim();

    print('Informe o Sexo (M ou F):');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();

    print('Informe o Peso (em kg):');
    String entradaPeso = stdin.readLineSync()!.trim().replaceAll(',', '.');
    double peso = double.parse(entradaPeso);

    String classificacao = '';
    // Lógica estritamente baseada na tabela do exercício
    if (peso >= 0 && peso <= 2) {
      classificacao = 'Baixo Peso';
      baixoPeso++;
    } else if (peso > 2 && peso <= 4) {
      classificacao = 'Normal';
      normal++;
    } else if (peso > 4) {
      classificacao = 'Alto Peso';
      altoPeso++;
    }

    print('\na) Recém-nascido registado:');
    print('Nome: $nome | Sexo: $sexo | Classificação: $classificacao');

    if (sexo == 'F' && peso > maiorPesoFem) {
      maiorPesoFem = peso;
      nomeMaiorPesoFem = nome;
    }

    total++;
  }

  print('\n--- Resumo Geral da Maternidade ---');
  if (total > 0) {
    print('b) Bebé do sexo feminino com o maior peso: $nomeMaiorPesoFem');
    print('c) Percentual de recém-nascidos por classificação de peso:');
    print('   - Baixo Peso: ${(baixoPeso / total) * 100}%');
    print('   - Normal: ${(normal / total) * 100}%');
    print('   - Alto Peso: ${(altoPeso / total) * 100}%');
  } else {
    print('Nenhum dado inserido.');
  }
}
