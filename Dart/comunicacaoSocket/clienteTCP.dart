import 'dart:io';

main() async {
  var socket = await Socket.connect('192.168.1.104', 3000);

  print('Conectado: ');
  var text;
  while (text != '0') {
    text = stdin.readLineSync();
    socket.write(text);
  }
  await socket.close();
  exit(0);
}
