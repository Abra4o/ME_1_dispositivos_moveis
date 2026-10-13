import 'dart:io';

void main() {
  const double valorHora = 12.30;

  double somaLiquidoMasculino = 0;
  double somaLiquidoFeminino = 0;
  int qtdMasculino = 0;
  int qtdFeminino = 0;

  List<String> listagem = [];

  while (true) {
    stdout.write('Código (9999 para encerrar): ');
    String codigo = stdin.readLineSync()!.trim();
    if (codigo == '9999') break;

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!.trim();

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.trim().toUpperCase();

    stdout.write('Horas de aula no mês: ');
    double horas = double.parse(
      stdin.readLineSync()!.trim().replaceAll(',', '.'),
    );

    double bruto = horas * valorHora;
    double desconto = sexo == 'M' ? 0.10 : 0.05;
    double liquido = bruto - bruto * desconto;

    if (sexo == 'M') {
      somaLiquidoMasculino += liquido;
      qtdMasculino++;
    } else if (sexo == 'F') {
      somaLiquidoFeminino += liquido;
      qtdFeminino++;
    }

    listagem.add(
      '${codigo.padRight(8)}${nome.padRight(25)}'
      '${('R\$ ' + bruto.toStringAsFixed(2)).padLeft(14)}'
      '${('R\$ ' + liquido.toStringAsFixed(2)).padLeft(14)}',
    );
  }

  print('');
  print(
    '${'Código'.padRight(8)}${'Nome'.padRight(25)}'
    '${'Salário Bruto'.padLeft(14)}${'Salário Líquido'.padLeft(14)}',
  );
  print('-' * 61);
  for (String linha in listagem) {
    print(linha);
  }
  print('-' * 61);

  if (qtdMasculino > 0) {
    double media = somaLiquidoMasculino / qtdMasculino;
    print(
      'Média dos salários líquidos (masculino): R\$ ${media.toStringAsFixed(2)}',
    );
  } else {
    print('Nenhum professor do sexo masculino foi cadastrado');
  }

  if (qtdFeminino > 0) {
    double media = somaLiquidoFeminino / qtdFeminino;
    print(
      'Média dos salários líquidos (feminino): R\$ ${media.toStringAsFixed(2)}',
    );
  } else {
    print('Nenhuma professora foi cadastrada');
  }
}
