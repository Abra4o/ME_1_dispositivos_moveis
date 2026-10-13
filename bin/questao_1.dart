void main() {
  const boloPrecos = {'ovos': 5.5, 'chocolate': 7.5, 'cenoura': 6.5};
  const ordem = ['ovos', 'chocolate'];
  double total = 0.0;

  for (var item in ordem) {
    if (boloPrecos.containsKey(item)) {
      total += boloPrecos[item]!;
    } else {
      print('$item não está no cardápio');
    }
  }

  if (total > 0) {
    print('Custo total dos ingredientes selecionados: $total');
  }
}
