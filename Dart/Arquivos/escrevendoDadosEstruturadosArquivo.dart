import 'dart:io';
import 'dart:convert';

main() {
  Map<String, String> data = Map(); //Criando Mapa (JSON)
  data.putIfAbsent('1', () => 'Gabriel'); //Add item (Não add chaves repitidas)
  data.putIfAbsent('2', () => 'Maria');
  data.putIfAbsent('3', () => 'Júlia');
  data.putIfAbsent('4', () => 'Stefani');
  data.putIfAbsent('5', () => 'Daniele');

  Directory dir = Directory.current;
  File file = File(dir.path + '/dadosEstruturados.txt');
  //'json.encode(data)' => converte para o padrão JSON (String)
  writeFile(file, json.encode(data));
  readFile(file);
}

void readFile(File file) {
  if (!file.existsSync()) //Verificando se o arquivo existe
  {
    print('Arquivo não encontrado!');
  }
  Map arq = json.decode(file.readAsStringSync()); //Convertendo o JSON para MAP
  print(arq);
}

void writeFile(File file, String data) {
  RandomAccessFile fileOpen = file.openSync(mode: FileMode.write);
  fileOpen.writeStringSync(data);
  fileOpen.flushSync();
  fileOpen.closeSync();
}
