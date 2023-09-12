import 'package:calculadora_imc_basic/model/pessoa.dart';

class PessoacDiretory {
  List<Pessoa> _pessoas = [];

  void adicionar(Pessoa pessoa) {
    _pessoas.add(pessoa);
  }

  void remove(String id) {
    _pessoas.remove(_pessoas.where((pessoa) => pessoa.id == id).first);
  }

  List<Pessoa> listarPessoas() {
    return _pessoas;
  }
}
