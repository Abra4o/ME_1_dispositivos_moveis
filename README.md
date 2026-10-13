# Medida de Eficiência

Projeto com 17 exercícios de programação desenvolvidos em Dart. Cada exercício é um programa independente, localizado na pasta `bin/`.

## Requisitos

- [Dart SDK](https://dart.dev/get-dart) 3.13.1 ou superior.

Confira se o Dart está instalado:

```bash
dart --version
```

## Como executar

No terminal, acesse a pasta do projeto e instale as dependências:

```bash
dart pub get
```

Execute o exercício desejado informando o número do arquivo. Por exemplo:

```bash
dart run bin/questao_1.dart
```

Para executar outro exercício, substitua `1` pelo número correspondente, de `1` a `17`. Os programas são independentes; execute um por vez. Quando solicitado, informe os dados pelo terminal.

## Estrutura do projeto

```text
bin/
  questao_1.dart
  ...
  questao_17.dart
lib/
  medida_de_eficiencia.dart
test/
  medida_de_eficiencia_test.dart
```

- `bin/`: programas dos exercícios.
- `lib/`: código da biblioteca do projeto.
- `test/`: testes automatizados.

## Testes

Para executar os testes automatizados:

```bash
dart test
```
