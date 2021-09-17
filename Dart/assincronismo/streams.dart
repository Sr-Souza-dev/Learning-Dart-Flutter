import 'dart:async';

/*
  As streams são assincronas (Executam em paralelo (atemporal))
  É aberto um espaço para comunicação onde é lançado um evento a cada nova interação
  (Podemos considerar um chat que a cada mensagem enviada o valor é atualizado para o usuario)
*/
main() {
  List<dynamic> listaDeEventos = [];
  //declarando quem ira adcionar um evendo ao espaço (controlador de eventos)
  var controlador = StreamController<dynamic>();
  print('Controlador: $controlador');
  //declarando o espaço em que o controlador acima irá operar
  var stream = controlador.stream;
  print('Stream: $stream');

  /*
    Ativando a funcionalidade de ficar observando o espaço (stream) para 
    identificar novos eventos.
    'listen(operando, finalizado)' => O comando listem recebe duas funções como 
    parametro, 'operando' é a função que diz o que deve ser feito com a nova 
    informação que foi adicionada ao canal e 'finalizado' que diz o que deve ser 
    feito após o canal ser fechado.
  */
  stream.listen((onData) {
    print('Evento disparado: ${onData}'); //imprimindo o dado novo
    listaDeEventos.add(onData); //Adcionando a lista de eventos
  }, onDone: () {
    print('Stream finalizada!');
    print(listaDeEventos);
  });
  controlador.sink.add('Leonardo'); //incluindo um evento a stream
  controlador.sink.add('Gabriel');
  controlador.sink.add('Dart');
  controlador.sink.add('Bast language');
  controlador.sink.add(45461548);
  controlador.close(); //fechando a stream;
  print('Canal aberto...');
}
