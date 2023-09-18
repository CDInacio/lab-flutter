import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa({required this.nome, required this.peso, required this.altura});

  double calcularIMC() {
    if (peso <= 0 || altura <= 0) {
      throw Exception('Peso e altura devem ser valores positivos.');
    }
    return peso / (altura * altura);
  }
}

void main() {
  try {
    stdout.write('Digite o nome: ');
    final nome = stdin.readLineSync()!;

    stdout.write('Digite o peso (em kg): ');
    final peso = double.parse(stdin.readLineSync()!);

    stdout.write('Digite a altura (em metros): ');
    final altura = double.parse(stdin.readLineSync()!);

    final pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
    final imc = pessoa.calcularIMC();

    print('Dados da Pessoa:');
    print('Nome: ${pessoa.nome}');
    print('Peso: ${pessoa.peso} kg');
    print('Altura: ${pessoa.altura} metros');
    print('IMC: $imc');
  } catch (e) {
    print('Erro: $e');
  }
}
