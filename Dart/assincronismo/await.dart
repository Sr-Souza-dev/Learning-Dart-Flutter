import 'dart:io';

/*
  'await' pode substituir as promise (future) para melhorar a visualização
  dos processos.
*/
main() async {
  print('Começou :D');
  appendFile();

  print(await readFile());
  print('####### fim ###########');
}

void appendFile() {
  File file = File(Directory.current.path + '/teste.txt');
  DateTime dt = DateTime.now();
  file.writeAsString(dt.toString() + '\r\n', mode: FileMode.append);
}

Future<String> readFile() {
  File file = File(Directory.current.path + '/teste.txt');
  return file.readAsString();
}
