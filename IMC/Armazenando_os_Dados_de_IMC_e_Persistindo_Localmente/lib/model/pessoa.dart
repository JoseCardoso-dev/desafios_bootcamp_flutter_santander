import 'package:flutter/material.dart';

class Pessoa {
  final String _id = UniqueKey().toString();
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  String _imc = "";

  String get id => _id;
  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;
  String get imc => _imc;

  Pessoa(this._nome, this._peso, this._altura, this._imc);

  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set imc(String imc) {
    _imc = imc;
  }
}
