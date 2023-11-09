String  verificarGanador(List<String> elementos){
  if ( (elementos[0] == 'X' &&  elementos[1] == 'X'  && elementos[2] == 'X' ) ||
       (elementos[0] == 'X' &&  elementos[3] == 'X'  && elementos[6] == 'X' ) ||
       (elementos[0] == 'X' &&  elementos[4] == 'X'  && elementos[8] == 'X' ) ||
       (elementos[1] == 'X' &&  elementos[4] == 'X'  && elementos[7] == 'X' ) ||
       (elementos[2] == 'X' &&  elementos[4] == 'X'  && elementos[6] == 'X' ) ||
       (elementos[2] == 'X' &&  elementos[5] == 'X'  && elementos[8] == 'X' ) ||
       (elementos[3] == 'X' &&  elementos[4] == 'X'  && elementos[5] == 'X' ) ||
       (elementos[6] == 'X' &&  elementos[7] == 'X'  && elementos[8] == 'X' ) 
      ) 
      { return "jugador"; }
  else {
    if ( (elementos[0] ==  'O' &&  elementos[1] == 'O'  && elementos[2] == 'O' ) ||
        (elementos[0] == 'O' &&  elementos[3] == 'O'  && elementos[6] == 'O' ) ||
        (elementos[0] == 'O' &&  elementos[4] == 'O'  && elementos[8] == 'O' ) ||
        (elementos[1] == 'O' &&  elementos[4] == 'O'  && elementos[7] == 'O' ) ||
        (elementos[2] == 'O' &&  elementos[4] == 'O'  && elementos[6] == 'O' ) ||
        (elementos[2] == 'O' &&  elementos[5] == 'O'  && elementos[8] == 'O' ) ||
        (elementos[3] == 'O' &&  elementos[4] == 'O'  && elementos[5] == 'O' ) ||
        (elementos[6] == 'O' &&  elementos[7] == 'O'  && elementos[8] == 'O' ) 
        ) 
        { return "app"; }
      else{
        if (!elementos.contains('')){
          return 'ninguno';
        }
      }
  }
      return '';

}