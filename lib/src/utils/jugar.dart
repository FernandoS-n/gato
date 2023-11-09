
import 'dart:math';

int jugar(List<String> elementos){
  if(elementos[0] == 'O' && elementos[2] == 'O' && elementos[1] == '') {return 1;}
  if(elementos[0] == 'O' && elementos[1] == 'O' && elementos[2] == '') {return 2;}
  if(elementos[0] == 'O' && elementos[3] == 'O' && elementos[6] == '') {return 6;}
  if(elementos[0] == 'O' && elementos[4] == 'O' && elementos[8] == '') {return 8;}
  if(elementos[0] == 'O' && elementos[6] == 'O' && elementos[3] == '') {return 3;}
  if(elementos[0] == 'O' && elementos[8] == 'O' && elementos[4] == '') {return 4;}
  if(elementos[1] == 'O' && elementos[2] == 'O' && elementos[0] == '') {return 0;}
  if(elementos[1] == 'O' && elementos[4] == 'O' && elementos[7] == '') {return 7;}
  if(elementos[1] == 'O' && elementos[7] == 'O' && elementos[4] == '') {return 4;}
  if(elementos[2] == 'O' && elementos[4] == 'O' && elementos[6] == '') {return 6;}
  if(elementos[2] == 'O' && elementos[5] == 'O' && elementos[8] == '') {return 8;}
  if(elementos[2] == 'O' && elementos[6] == 'O' && elementos[4] == '') {return 4;}
  if(elementos[2] == 'O' && elementos[8] == 'O' && elementos[5] == '') {return 5;}
  if(elementos[3] == 'O' && elementos[4] == 'O' && elementos[5] == '') {return 5;}
  if(elementos[3] == 'O' && elementos[5] == 'O' && elementos[4] == '') {return 4;}
  if(elementos[3] == 'O' && elementos[6] == 'O' && elementos[0] == '') {return 0;}
  if(elementos[4] == 'O' && elementos[5] == 'O' && elementos[3] == '') {return 3;}
  if(elementos[4] == 'O' && elementos[6] == 'O' && elementos[2] == '') {return 2;}
  if(elementos[4] == 'O' && elementos[7] == 'O' && elementos[1] == '') {return 1;}
  if(elementos[4] == 'O' && elementos[8] == 'O' && elementos[0] == '') {return 0;}
  if(elementos[5] == 'O' && elementos[8] == 'O' && elementos[2] == '') {return 2;}
  if(elementos[6] == 'O' && elementos[7] == 'O' && elementos[8] == '') {return 8;}
  if(elementos[6] == 'O' && elementos[8] == 'O' && elementos[7] == '') {return 7;}
  if(elementos[7] == 'O' && elementos[8] == 'O' && elementos[6] == '') {return 6;}

  if(elementos[0] == 'X' && elementos[2] == 'X' && elementos[1] == '') {return 1;}
  if(elementos[0] == 'X' && elementos[1] == 'X' && elementos[2] == '') {return 2;}
  if(elementos[0] == 'X' && elementos[3] == 'X' && elementos[6] == '') {return 6;}
  if(elementos[0] == 'X' && elementos[4] == 'X' && elementos[8] == '') {return 8;}
  if(elementos[0] == 'X' && elementos[6] == 'X' && elementos[3] == '') {return 3;}
  if(elementos[0] == 'X' && elementos[8] == 'X' && elementos[4] == '') {return 4;}
  if(elementos[1] == 'X' && elementos[2] == 'X' && elementos[0] == '') {return 0;}
  if(elementos[1] == 'X' && elementos[4] == 'X' && elementos[7] == '') {return 7;}
  if(elementos[1] == 'X' && elementos[7] == 'X' && elementos[4] == '') {return 4;}
  if(elementos[2] == 'X' && elementos[4] == 'X' && elementos[6] == '') {return 6;}
  if(elementos[2] == 'X' && elementos[5] == 'X' && elementos[8] == '') {return 8;}
  if(elementos[2] == 'X' && elementos[6] == 'X' && elementos[4] == '') {return 4;}
  if(elementos[2] == 'X' && elementos[8] == 'X' && elementos[5] == '') {return 5;}
  if(elementos[3] == 'X' && elementos[4] == 'X' && elementos[5] == '') {return 5;}
  if(elementos[3] == 'X' && elementos[5] == 'X' && elementos[4] == '') {return 4;}
  if(elementos[3] == 'X' && elementos[6] == 'X' && elementos[0] == '') {return 0;}
  if(elementos[4] == 'X' && elementos[5] == 'X' && elementos[3] == '') {return 3;}
  if(elementos[4] == 'X' && elementos[6] == 'X' && elementos[2] == '') {return 2;}
  if(elementos[4] == 'X' && elementos[7] == 'X' && elementos[1] == '') {return 1;}
  if(elementos[4] == 'X' && elementos[8] == 'X' && elementos[0] == '') {return 0;}
  if(elementos[5] == 'X' && elementos[8] == 'X' && elementos[2] == '') {return 2;}
  if(elementos[6] == 'X' && elementos[7] == 'X' && elementos[8] == '') {return 8;}
  if(elementos[6] == 'X' && elementos[8] == 'X' && elementos[7] == '') {return 7;}
  if(elementos[7] == 'X' && elementos[8] == 'X' && elementos[6] == '') {return 6;}

  Random numRandom = Random();
  int numero = numRandom.nextInt(8) + 1;
  while (elementos[numero] != ''){
    numero++;
    if (numero ==9) {
      numero = 0;
    }
  }

return numero;
}