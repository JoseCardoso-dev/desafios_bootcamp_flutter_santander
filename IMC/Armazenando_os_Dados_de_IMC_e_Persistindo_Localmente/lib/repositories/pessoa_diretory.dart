import 'package:calculadora_imc_persistencia_de_dados/model/pessoa_model.dart';
import 'package:hive/hive.dart';

class PessoacDiretory {
  Box? _box;
  late bool addPessoa;

  //List<PessoaModel> _pessoas = [];

  void carregar() async {
    if (Hive.isBoxOpen('pessoas')) {
      _box = Hive.box('pessoas');
    } else {
      _box = await Hive.openBox('pessoas');
    }
  }

  void adicionar(PessoaModel pessoa) async {
    carregar();
    await _box!.add(pessoa);
    //_box!.put(pessoa.id,
    //    [pessoa.id, pessoa.nome, pessoa.peso, pessoa.altura, pessoa.imc]);
  }

  Future<void> remove(String id) async {
    carregar();
    int pessoaIndex = -1;

    for (int i = 0; i < _box!.length; i++) {
      final pessoa = _box!.getAt(i) as PessoaModel;
      if (pessoa.id == id) {
        pessoaIndex = i;
        break;
      }
    }

    if (pessoaIndex != -1) {
      await _box!.deleteAt(pessoaIndex);
    }
  }

  List<dynamic> listarPessoas() {
    carregar();
    if (_box != null) {
      List<dynamic> pessoas = _box!.values.toList();

      return pessoas;
    } else {
      return <dynamic>[];
    }
  }
}
