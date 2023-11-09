import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gato/src/models/model.dart';
import 'package:gato/src/utils/actualizar_datos.dart';
import 'package:gato/src/utils/jugar.dart';
import 'package:gato/src/utils/reiniciar.dart';
import 'package:gato/src/utils/verificar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final colorPrincipal = const Color.fromARGB(255, 8, 138, 121);
  List<String> elementos = ['','','','','','','','',''];
  List<Color> colorTexto = [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black, Colors.black,Colors.black, Colors.black, Colors.black ];
  List<Color> colorFondo = [const Color.fromARGB(255, 8, 138, 121),
                          const Color.fromARGB(255, 8, 138, 121),
                          const Color.fromARGB(255, 8, 138, 121,),
                          const Color.fromARGB(255, 8, 138, 121,),
                          const Color.fromARGB(255, 8, 138, 121,),
                          const Color.fromARGB(255, 8, 138, 121,),
                          const Color.fromARGB(255, 8, 138, 121,),
                          const Color.fromARGB(255, 8, 138, 121,),
                          const Color.fromARGB(255, 8, 138, 121,),];
  String mensaje = '';
  String puntajes1 = '';
  String puntajes2 = '';
  String ganador = '';
  int? juegos;
  int? ganados;
  int? perdidos;
  int? empatados;
  TextStyle estiloPuntajes = const TextStyle(fontSize: 22, color: Colors.white);
  List<ModeloGato>? regPuntos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 51, 51),
      appBar: AppBar(
        backgroundColor: colorPrincipal,
        title: const Text('Gato App'),
      ),
      body: Center(child: dibujarTablero()),
      floatingActionButton: crearBotones(),
    
    );
  }
  
  Widget dibujarTablero() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dibujarFila(0),),
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dibujarFila(3),),
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dibujarFila(6),),
        const SizedBox(height: 30),
        Text(mensaje, style: const TextStyle(
          fontSize: 25,
          color:  Colors.white,
          backgroundColor: Colors.orange
        ),),
        const SizedBox(height: 40),
        puntajes1 != ''
        ?
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 81, 4, 181),
          ),
          child: Column(children: [
            Text(puntajes1, style: estiloPuntajes),
            const SizedBox(height: 15,),
            Text(puntajes2, style: estiloPuntajes),
          ]),
        )
        : Container()
      ],
    );

  }
  
  List<Widget> dibujarFila(int numInicial) {
    List<Widget> fila = [];
    for( int i = numInicial; i < numInicial+3; i++ ){
      fila.add(
        FloatingActionButton(
          onPressed: (){
            if (elementos[i] == '' && ganador == '' ){
              colorFondo[i] = Colors.red;
              elementos[i] ='X';
              colorTexto[i] = Colors.white;
              setState(() {});
              ganador = verificarGanador(elementos);
              if( ganador == ''){
                setState(() {
                  int jugada = jugar(elementos);
                  elementos[jugada] = 'O';
                  colorFondo[jugada] = Colors.white;
                  colorTexto[jugada] = Colors.black;
                });       
                ganador = verificarGanador(elementos);
              }

              if ( ganador == 'jugador'){
                setState(()=> mensaje = "Tú ganas!");
              }
              if ( ganador == "app"){
                setState(()=> mensaje = "Tú pierdes!");
              }
              if ( ganador == "ninguno"){
                setState(()=> mensaje = "Es un empate!");
              }
              if (ganador != '') {
                mostrarPuntos(ganador);
              }
            }
          },
          backgroundColor: colorFondo[i],
          child: Text(elementos[i],style: 
            TextStyle(
              fontSize: 27,
              color: colorTexto[i]
            ),),
          )
      );
      fila.add(const SizedBox(width: 15,));
    }

    return fila;
  }
  
 Widget crearBotones() {
   return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 155,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorPrincipal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))
          ),
          onPressed: nuevoJuego, 
          child: const Text ('NUEVO JUEGO', style: TextStyle(fontSize: 17),)),
      ),
      const SizedBox(width: 20),
      SizedBox(
          width: 155,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))
            ),
            onPressed: (){
              reiniciarBd();
              nuevoJuego();
            }, 
            child: const Text ('REINICIAR', style: TextStyle(fontSize: 17),)),
        )
    ],);

  }

 void nuevoJuego(){
          elementos = ['','','','','','','','',''];
          colorTexto = [Colors.black, Colors.black, Colors.black, Colors.black, Colors.black, Colors.black,Colors.black, Colors.black, Colors.black ];
          colorFondo = [const Color.fromARGB(255, 8, 138, 121),
                        const Color.fromARGB(255, 8, 138, 121),
                        const Color.fromARGB(255, 8, 138, 121,),
                        const Color.fromARGB(255, 8, 138, 121,),
                        const Color.fromARGB(255, 8, 138, 121,),
                        const Color.fromARGB(255, 8, 138, 121,),
                        const Color.fromARGB(255, 8, 138, 121,),
                        const Color.fromARGB(255, 8, 138, 121,),
                        const Color.fromARGB(255, 8, 138, 121,),];
          mensaje = '';
          puntajes1 = '';
          puntajes2 = '';
          ganador = '';
          Random numRandom = Random();
          int primerTurno = numRandom.nextInt(2) +1;
          if (primerTurno == 1){
            int primeraJugada = numRandom.nextInt(8) +1;
            elementos[primeraJugada] = 'O';
            colorTexto[primeraJugada] = Colors.black;
            colorFondo[primeraJugada] = Colors.white;
          }
          setState(() { });
        }
  
  Future<List<ModeloGato>> mostrarPuntos(String ganador) async{
    regPuntos = await actualizar(ganador);
    for (var element in regPuntos!) {
      setState(() {
        juegos = element.juegos;
        ganados = element.ganados;
        perdidos = element.perdidos;
        empatados = element.empatados;
        puntajes1 = 'Juegos: $juegos   - Ganados: $ganados';
        puntajes2 = 'Empates: $empatados  - Perdidos: $perdidos';
      });
    }
    return [];
  }
}