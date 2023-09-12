import 'package:calculadora_imc_basic/model/pessoa.dart';
import 'package:calculadora_imc_basic/repositories/pessoa_diretory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Pessoa pessoa;
  var nomeCrontroller = TextEditingController();
  var pesoCrontroller = TextEditingController();
  var alturaCrontroller = TextEditingController();
  var pessoaRepository = PessoacDiretory();
  var pessoas = <Pessoa>[];
  double imc = 0;
  String imcTxt = "";

  @override
  void initState() {
    super.initState();
    carregandoDados();
  }

  void carregandoDados() {
    setState(() {
      pessoas = pessoaRepository.listarPessoas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.calculate),
          onPressed: () {
            nomeCrontroller.text = "";
            pesoCrontroller.text = "";
            alturaCrontroller.text = "";

            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Calcular IMC"),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: nomeCrontroller,
                              style: const TextStyle(fontSize: 15),
                              decoration: const InputDecoration(
                                  hintText: "Digite o seu Nome"),
                            ),
                            TextField(
                              controller: pesoCrontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}$'))
                              ],
                              style: const TextStyle(fontSize: 15),
                              decoration: const InputDecoration(
                                  hintText: "Digite o seu Peso (kg)"),
                            ),
                            TextField(
                              controller: alturaCrontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}$'))
                              ],
                              style: const TextStyle(fontSize: 15),
                              decoration: const InputDecoration(
                                  hintText: "Digite a sua Altura (m)"),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancelar")),
                                TextButton(
                                    onPressed: () {
                                      imc = double.parse(
                                              pesoCrontroller.text.trim()) /
                                          (double.parse(alturaCrontroller.text
                                                  .trim()) *
                                              double.parse(alturaCrontroller
                                                  .text
                                                  .trim()));
                                      if (imc < 16) {
                                        imcTxt = "Magreza Grave";
                                      } else if ((imc < 17)) {
                                        imcTxt = "Magreza Moderada";
                                      } else if ((imc < 18.5)) {
                                        imcTxt = "Magreza Leve";
                                      } else if ((imc < 25)) {
                                        imcTxt = "Saudável";
                                      } else if ((imc < 30)) {
                                        imcTxt = "Sobrepeso";
                                      } else if ((imc < 35)) {
                                        imcTxt = "Obsidade Grau I";
                                      } else if ((imc < 40)) {
                                        imcTxt = "Obsidade Grau II (severa)";
                                      } else if ((imc > 40)) {
                                        imcTxt = "Obsidade Grau III (mórbida)";
                                      }

                                      pessoa = Pessoa(
                                          nomeCrontroller.text.trim(),
                                          double.parse(
                                              pesoCrontroller.text.trim()),
                                          double.parse(
                                              alturaCrontroller.text.trim()),
                                          imcTxt);
                                      pessoaRepository.adicionar(pessoa);
                                      carregandoDados();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Calcular")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Historico de Calculos",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: pessoas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var pessoa = pessoas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) {
                      pessoaRepository.remove(pessoa.id);
                    },
                    key: Key(pessoa.id),
                    child: ListTile(
                      title: Text(pessoa.nome),
                      subtitle: Text("O resultado do seu IMC é: ${pessoa.imc}"),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
