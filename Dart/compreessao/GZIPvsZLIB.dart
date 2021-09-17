import 'dart:io';
import 'dart:convert';

/*
  A maneira de implementação das dus funcionalidades é a mesma, mundando apenas
  o préfixo.
  GZIP => Comprime mais rápido, mas perde no fator de compressão
  ZLIB => Comprime mais lento, mas ganha no fator de compressão
*/
main() {
  int zlib_comp = testCompress(zlib);
  int gzip_comp = testCompress(gzip);

  print('GZIP: $gzip_comp');
  print('ZLIB: $zlib_comp');
}

String generateData() {
  String data = '';
  for (int i = 0; i < 100000; i++) {
    data += 'Olá Mundo\r\n';
  }
  return data;
}

int testCompress(var codec) {
  String data = generateData();

  List<int> original = utf8.encode(data);
  List<int> compressed = codec.encode(original);
  List<int> decompressed = codec.decode(compressed);

  //Imprimindo resultados
  print('Testando ${codec.toString()}');
  print('Original: ${original.length} bytes');
  print('Descomprimido: ${decompressed.length} bytes');
  print('Comprimido: ${compressed.length} bytes');

  print('');

  String decoded = utf8.decode(decompressed);
  assert(data == decoded, 'São diferentes');
  return compressed.length;
}
