import 'package:gato/src/models/model.dart';
import 'package:gato/src/providers/gato_database.dart';

Future<List<ModeloGato>> actualizar( String ganador )  async {
  List<ModeloGato> registros = [];
  String campo  = '';
  int valor     = 0;
  int nJuegos   = 0;
  int nGanados  = 0;
  int nPerdidos = 0;
  int nEmpatados= 0;

  registros = await GatoDatabase.instance.getItems();
  if ( registros.isEmpty ) {
    nJuegos = 1;
    switch (ganador) {
      case 'jugador': nGanados = 1;
        break;
      case 'app': nPerdidos = 1;
        break;
      case 'ninguno': nEmpatados = 1;
        break;
    }
    final registro = ModeloGato(
      nombre: 'Usuario', 
      juegos: nJuegos, 
      ganados: nGanados, 
      perdidos: nPerdidos, 
      empatados: nEmpatados);
    await GatoDatabase.instance.insert(registro);
    registros.add(registro);
  }
  else {
    registros = await GatoDatabase.instance.getItems();
    for ( var element in registros ) {
      nJuegos    = element.juegos;
      nGanados   = element.ganados;
      nPerdidos  = element.perdidos;
      nEmpatados = element.empatados;
      nJuegos++;
      switch (ganador) {
        case 'jugador' : 
          nGanados++;
          campo = 'ganados';
          valor = nGanados;
          break;
        case 'app' : 
          nPerdidos++;
          campo = 'perdidos';
          valor = nPerdidos;
          break;
        case 'ninguno' : 
          nEmpatados++;
          campo = 'empatados';
          valor = nEmpatados;
          break;
      }
      await GatoDatabase.instance.update('Usuario', campo, valor, nJuegos);
      registros = await GatoDatabase.instance.getItems();
    }
  }
  return registros;

}