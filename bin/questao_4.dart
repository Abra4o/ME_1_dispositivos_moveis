import 'dart:io';

void main() {
  int totalAlunos = 0;
  double somaTurma = 0;
  int totalAprovados = 0;
  int totalFem = 0;
  double somaFem = 0;

  double maiorMediaMasc = -1;
  String matMaiorMasc = '';
  double maiorMediaFem = -1;
  String matMaiorFem = '';

  while (true) {
    print('Digite a matrícula do aluno (0000 para encerrar):');
    String matricula = stdin.readLineSync()!;
    if (matricula == '0000') break;

    print('Digite o nome do aluno:');
    String nome = stdin.readLineSync()!;
    print('Digite o sexo do aluno (M ou F):');
    String sexo = stdin.readLineSync()!.toUpperCase();
    print('Digite a primeira nota (use ponto para casas decimais):');
    double n1 = double.parse(stdin.readLineSync()!);
    print('Digite a segunda nota (use ponto para casas decimais):');
    double n2 = double.parse(stdin.readLineSync()!);
    print('Digite a terceira nota (use ponto para casas decimais):');
    double n3 = double.parse(stdin.readLineSync()!);
    print('Digite o número de faltas:');
    int faltas = int.parse(stdin.readLineSync()!);

    double media = (n1 + n2 + n3) / 3;
    bool aprovado = media >= 7.0 && faltas <= 18;

    totalAlunos++;
    somaTurma += media;

    if (aprovado) {
      totalAprovados++;
      if (sexo == 'M' && media > maiorMediaMasc) {
        maiorMediaMasc = media;
        matMaiorMasc = matricula;
      } else if (sexo == 'F' && media > maiorMediaFem) {
        maiorMediaFem = media;
        matMaiorFem = matricula;
      }
    }

    if (sexo == 'F') {
      totalFem++;
      somaFem += media;
    }
  }

  if (totalAlunos > 0) {
    print('Média geral da turma: ${somaTurma / totalAlunos}');
    print(
      'Percentual de alunos aprovados: '
      '${(totalAprovados / totalAlunos) * 100}%',
    );
    print(
      'Matrícula do aluno aprovado com maior média (M): '
      '${matMaiorMasc.isEmpty ? "nenhum" : matMaiorMasc}',
    );
    print(
      'Matrícula da aluna aprovada com maior média (F): '
      '${matMaiorFem.isEmpty ? "nenhuma" : matMaiorFem}',
    );
  }
  if (totalFem > 0) {
    print('Média das alunas: ${somaFem / totalFem}');
  }
  if (totalAlunos == 0) {
    print('Nenhum aluno foi cadastrado.');
  }
}
