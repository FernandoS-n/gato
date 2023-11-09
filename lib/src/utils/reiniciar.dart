

import 'package:gato/src/models/model.dart';
import 'package:gato/src/providers/gato_database.dart';

Future<List<ModeloGato>> reiniciarBd() async {
  List<ModeloGato> registros = [];
  await GatoDatabase.instance.reset();
  registros = await GatoDatabase.instance.getItems();
  return registros;
}