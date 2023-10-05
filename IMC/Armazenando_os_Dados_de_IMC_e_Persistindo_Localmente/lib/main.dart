import 'package:calculadora_imc_persistencia_de_dados/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provaider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDiretory =
      await path_provaider.getApplicationDocumentsDirectory();
  Hive.init(documentsDiretory.path);
  runApp(const MyApp());
}
