import 'dart:io';
import 'dart:convert';

main() {
  String data = '';
  for (int i = 0; i < 100; i++) {
    data = data + 'Olá Mundo! \r\n';
  }

  //Convertendo a string em uma lista de byts (Acis)
  List<int> original = utf8.encode(data);

  //Comprimindo os dados
  List<int> compressed = gzip.encode(original);

  //Descomprimindo os dados
  List<int> decompressed = gzip.decode(compressed);

  //Passando para o padra string novamente
  String decoded = utf8.decode(decompressed);

  //Imprimindo resultados
  print('Original: ${original.length} bytes');
  print('Descomprimido: ${decompressed.length} bytes');
  print('Comprimido: ${compressed.length} bytes');
}
