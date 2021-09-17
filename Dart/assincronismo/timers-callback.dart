import 'dart:async'; //Para utilizar o Timer

int counter = 0;
/*
  Os timers executam de forma assincrona, o que implica que o resto do código 
  continua executando normalmente em paralelo.
*/
main() {
  Duration duration = Duration(seconds: 3); //Declarando uma variavel com 3sec
  //A função 'periodic' espera o tempo 'duraction' e chama a função 'timeout'
  //recursivamente, até seja identificado o 'timer.cancel()'
  Timer.periodic(duration, timeout);

  print('Iniciado ${getTime()}');
}

void timeout(Timer timer) //Função callback
{
  print('Espera: ${getTime()}');
  if (counter >= 5) {
    timer.cancel();
  }
  counter++;
}

String getTime() {
  DateTime dt = DateTime.now();
  return dt.toString();
}
