import 'package:test/test.dart';

import '../bin/desafio.dart'; // Importe a biblioteca test.

void main() {
  group('Pessoa', () {
    test('Calculo do IMC', () {
      final pessoa = Pessoa(nome: 'João', peso: 70.0, altura: 1.75);
      expect(
          pessoa.calcularIMC(),
          closeTo(22.86,
              0.01)); // Espera-se que o IMC seja aproximadamente 22.86 com uma margem de erro de 0.01.
    });

    test('Peso e altura inválidos', () {
      expect(() => Pessoa(nome: 'Maria', peso: -50.0, altura: 1.65),
          throwsException); // Espera-se que uma exceção seja lançada devido ao peso negativo.
      expect(() => Pessoa(nome: 'Carlos', peso: 70.0, altura: -1.65),
          throwsException); // Espera-se que uma exceção seja lançada devido à altura negativa.
    });

    test('Nome vazio', () {
      expect(() => Pessoa(nome: '', peso: 60.0, altura: 1.70),
          throwsException); // Espera-se que uma exceção seja lançada devido ao nome vazio.
    });

    test('Entrada nula', () {
      expect(() => Pessoa(nome: null, peso: 60.0, altura: 1.70),
          throwsException); // Espera-se que uma exceção seja lançada devido ao nome nulo.
    });
  });
}
