import 'dart:io';
import 'dart:math';

void main() {
  int alvo = Random().nextInt(100) + 1;
  int min = 0;
  int max = 100;
  int palpite = -1;

  print('--- Jogo de Adivinhação ---');
  print('O computador escolheu um número entre 1 e 100. Tente adivinhar!');

  while (palpite != alvo) {
    print('\nDigite o seu palpite:');
    palpite = int.parse(stdin.readLineSync()!);

    if (palpite == alvo) {
      print('Parabéns! Você acertou o número gerado.');
    } else {
      if (palpite > alvo && palpite < max) {
        max = palpite;
      } else if (palpite < alvo && palpite > min) {
        min = palpite;
      }
      print('Dica: O número está entre $min e $max');
    }
  }
}
