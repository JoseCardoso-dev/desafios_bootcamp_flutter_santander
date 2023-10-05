import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class PessoaModel {
  @HiveField(0)
  final String _id = UniqueKey().toString();
  @HiveField(1)
  String _nome = "";
  @HiveField(2)
  double _peso = 0;
  @HiveField(3)
  double _altura = 0;
  @HiveField(4)
  String _imc = "";

  String get id => _id;
  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;
  String get imc => _imc;

  PessoaModel(this._nome, this._peso, this._altura, this._imc);

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
