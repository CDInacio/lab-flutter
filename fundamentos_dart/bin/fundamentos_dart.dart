void main(List<String> arguments) {
  // formas de declarar variáveis

  // String text1 = 'ola mundo';
  // var text2 = 'ola mundo2';
  // String text3;

  // ## TIPOS DE DADOS INTEIROS ##
  // var num1 = 10;
  // var num2 = 11;

  // print('Retorna true se e somente se esse inteiro for par');
  // print(num1.isEven);
  // print(num2.isEven);

  // print('Retorna true se e somente se esse inteiro for impar');
  // print(num1.isOdd);
  // print(num2.isOdd);

  // print('Retorna se o numero for finito');
  // print(num1.isFinite);
  // print(num2.isFinite);

  // print('Retorna se o numero for INfinito');
  // print(double.infinity);

  // print('Retorna se o numero não é válido');
  // print(num1.isNaN);

  // print('Retorna se o numero é negativo');
  // print(num1.isNegative);
  // print((num1 * -1).isNegative);

  // print('Converte String para inteiro');
  // print(int.parse('10'));
  // print(int.tryParse('test')); // retorna null se não conseguir. Evitar dar erro no sistema.

  // ## TIPOS DE DADOS DOUBLE ##
  //   double num3 = 10.1;
  //   double num4 = 11.1;

  //   print('Remove ponto flutuante');
//   print(num3.truncate());
//   print(num4.truncate());

  //   print('Converte para inteiro');
  //   print(num3.toInt());

  //   print('Arredonda para cima');
  //   print(num3.ceil());
  //   print(num4.ceil());

  //   print('Arredonda para baixo');
  //   print(num3.floor());
  //   print(num4.floor());

  //   print('Retorna se o número é válido');
  //   print(num4.isNaN);

  // ## TIPOS DE DADOS STRING ##
  // String text1 = 'Ola mundo';
  // var text2 = 'Ola mundo de novo';

  // print('Comparação se vazio');
  // print(text1.isEmpty);

  // print('Obtém o tamanho da string');
  // print(text1.length);

  // print('Maiusculo / Minusculo');
  // print(text1.toUpperCase());
  // print(text1.toLowerCase());

  // print('Obtem parte da string');
  // print(text1.substring(1, 5)); // começa do caractere 1 até o caractere 5
  // print(text2.substring(5)); // começa do caractere 5 até o final da string

  // print('Obtem a posição de um texto em que uma string começa');
  // print(text2.indexOf('mundo'));

  // print('Substitui uma string por outra');
  // print(text1.replaceAll('a', 'o'));

  // print('Quebra uma string por um caracter específico e retorna um array');
  // print(text2.split('a'));
  // print('NOME;ENRERECO;CEP'.split(';'));

  // print('Remove espaços');
  // print(' Dezz nuts'.trim());
  // print('Dezz nuts '.trimLeft());
  // print(' Dezz nuts '.trimRight());

  // ## TIPOS DE DADOS BOOLEAN ##
  var varTrue = true;
  bool varFalse = false;

  print(varTrue);
  print(varFalse);

  print(!varFalse); // true
  print(!varTrue); // false
}
