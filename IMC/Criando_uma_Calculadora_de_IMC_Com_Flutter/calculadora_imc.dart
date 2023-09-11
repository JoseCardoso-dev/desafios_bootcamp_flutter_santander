import 'dart:io';

import 'pessoa.dart';

void main() {
  var pessoa = Pessoa();
  String resultadoText = "";

  stdout.write('Digite seu nome: ');
  pessoa.nome = stdin.readLineSync().toString().trim();

  stdout.write('Digite seu peso: ');
  pessoa.peso = double.tryParse(stdin.readLineSync().toString().trim())!;

  stdout.write('Digite sua altura: ');
  pessoa.altura = double.tryParse(stdin.readLineSync().toString().trim())!;

  var resultadoImc = pessoa.peso / (pessoa.altura * pessoa.altura);

  if (resultadoImc < 16) {
    resultadoText = "Magreza Grave";
  } else if ((resultadoImc < 17)) {
    resultadoText = "Magreza Moderada";
  } else if ((resultadoImc < 18.5)) {
    resultadoText = "Magreza Leve";
  } else if ((resultadoImc < 25)) {
    resultadoText = "Saudável";
  } else if ((resultadoImc < 30)) {
    resultadoText = "Sobrepeso";
  } else if ((resultadoImc < 35)) {
    resultadoText = "Obsidade Grau I";
  } else if ((resultadoImc < 40)) {
    resultadoText = "Obsidade Grau II (severa)";
  } else if ((resultadoImc > 40)) {
    resultadoText = "Obsidade Grau III (mórbida)";
  }

  print('Olá ${pessoa.nome}! O resultado do seu IMC foi: $resultadoText');
}
