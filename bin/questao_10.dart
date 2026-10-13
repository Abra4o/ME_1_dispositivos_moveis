import 'dart:io';

void main() {
  int totalM = 0;
  int totalF = 0;
  int somaIdadeMExp = 0;
  int countMExp = 0;
  int countM45 = 0;
  int countF30Exp = 0;

  int menorIdadeFExp = 999;
  String nomeMenorFExp = '';

  print('--- Pesquisa de Perfil de Candidatos ---');
  print('Para finalizar, digite "FIM" no nome.');

  while (true) {
    print('\nNome do candidato (ou "FIM" para sair):');
    String nome = stdin.readLineSync()!;
    if (nome == 'FIM') break;

    print('Sexo do candidato (M ou F):');
    String sexo = stdin.readLineSync()!.toUpperCase();
    print('Idade:');
    int idade = int.parse(stdin.readLineSync()!);
    print('Tem experiência no serviço? (S ou N):');
    String exp = stdin.readLineSync()!.toUpperCase();

    if (sexo == 'F') {
      totalF++;
      if (idade < 30 && exp == 'S') {
        countF30Exp++;
      }
      if (exp == 'S' && idade < menorIdadeFExp) {
        menorIdadeFExp = idade;
        nomeMenorFExp = nome;
      }
    } else if (sexo == 'M') {
      totalM++;
      if (exp == 'S') {
        somaIdadeMExp += idade;
        countMExp++;
      }
      if (idade > 45) {
        countM45++;
      }
    }
  }

  print('\n--- Relatório Final dos Candidatos ---');
  print('a) Total de candidatas do sexo feminino: $totalF');
  print('   Total de candidatos do sexo masculino: $totalM');
  if (countMExp > 0)
    print(
      'b) Idade média dos homens com experiência: ${somaIdadeMExp / countMExp}',
    );
  if (totalM > 0)
    print(
      'c) Porcentagem dos homens com mais de 45 anos: ${(countM45 / totalM) * 100}%',
    );
  print(
    'd) Número de mulheres com menos de 30 anos e com experiência: $countF30Exp',
  );
  print(
    'e) Nome da candidata mais nova que já possui experiência: $nomeMenorFExp',
  );
}
