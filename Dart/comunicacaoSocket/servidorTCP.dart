import 'dart:io';
import 'dart:convert';

/*
    Comunicação TCP é um caminho seguro onde os dados podem transitar,
    ele se sertifica de que o que foi enviado está sendo recebido
    Tem mais bit no pacote de dados referente a configuração e segurança
*/
main() async {
  //Criando um servidor no endereçço ip '192...' na porta 3000
  var serverSocket = await ServerSocket.bind('192.168.1.104', 3000);
  print('Escutando mensagens do além...');

  //Escutando o servidor
  await for (var socket in serverSocket) {
    socket.listen((List<int> values) {
      print(
          '${socket.remoteAddress} : ${socket.remotePort} => ${utf8.decode(values)}');
    });
  }
}
