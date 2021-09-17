import 'dart:io';
import 'dart:convert';

main() {
  var data = '***** Informações enviadas via protocolo udp ******';
  List<int> dataToSend = utf8.encode(data);
  int port = 3000;

  //Criando servidor
  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, port)
      .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        print('Servidor Escutando...');
        dynamic dg = udpSocket.receive();
        print(utf8.decode(dg.data));
      }
    });
    //Criando um cliente
    udpSocket.send(dataToSend, InternetAddress.loopbackIPv4, port);

    udpSocket.close();
  });
}
