void main() {
  for (int n = 1000; n <= 9999; n++) {
    int esquerda = n ~/ 100;
    int direita = n % 100;
    int soma = esquerda + direita;

    if (soma * soma == n) {
      print('$n = $esquerda + $direita = $soma * $soma');
    }
  }
}
