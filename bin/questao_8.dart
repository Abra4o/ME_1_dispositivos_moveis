import 'dart:io';

void main() {
  int totalM = 0;
  int totalF = 0;
  int total = 0;
  List<String> candidatosCCAcima2500 = [];

  double menorPontuacaoM = 6000;
  String nomeMenorM = '';
  double maiorPontuacaoSI_M = -1;
  String codMaiorSI_M = '';

  print('--- Levantamento do Vestibular UNIT ---');
  print('Digite o código "0000" para finalizar as inserções.');

  print('\nCandidatos de Ciência da Computação com mais de 2500 pontos:');

  while (true) {
    print('\nInforme o Código do candidato (ou "0000" para terminar):');
    String codigo = stdin.readLineSync()!;
    if (codigo == '0000') break;

    print(
      'Curso (CC para Ciência da Computação ou SI para Sistemas de Informação):',
    );
    String curso = stdin.readLineSync()!.toUpperCase();
    print('Nome do candidato:');
    String nome = stdin.readLineSync()!;
    print('Sexo do candidato (M ou F):');
    String sexo = stdin.readLineSync()!.toUpperCase();
    print('Pontuação alcançada (0 a 5000):');
    double pontuacao = double.parse(stdin.readLineSync()!);

    total++;

    if (curso == 'CC' && pontuacao > 2500) {
      candidatosCCAcima2500.add(
        'Código: $codigo, Nome: $nome, Pontuação: $pontuacao',
      );
      print(
        '-> [Aprovado no Filtro a)] Código: $codigo, Nome: $nome, Pontuação: $pontuacao',
      );
    }

    if (sexo == 'M') {
      totalM++;
      if (pontuacao < menorPontuacaoM) {
        menorPontuacaoM = pontuacao;
        nomeMenorM = nome;
      }
      if (curso == 'SI' && pontuacao > maiorPontuacaoSI_M) {
        maiorPontuacaoSI_M = pontuacao;
        codMaiorSI_M = codigo;
      }
    } else if (sexo == 'F') {
      totalF++;
    }
  }

  print('\n--- Resultados Finais do Levantamento ---');
  print('a) Candidatos de Ciência da Computação com mais de 2500 pontos:');
  for (final candidato in candidatosCCAcima2500) {
    print('   - $candidato');
  }
  print(
    'b) Nome do candidato do sexo masculino com a menor pontuação geral: $nomeMenorM',
  );
  print(
    'c) Código do candidato masculino com a maior pontuação em Sistemas de Informação: $codMaiorSI_M',
  );

  if (total > 0) {
    print('d) Percentuais de inscritos no vestibular:');
    print('   - Sexo Masculino: ${(totalM / total) * 100}%');
    print('   - Sexo Feminino: ${(totalF / total) * 100}%');
  }
}
