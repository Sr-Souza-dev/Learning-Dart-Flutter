import 'dart:io';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  List<String> files = [];
  Directory.current.listSync().forEach((FileSystemEntity fse) {
    if(fse.statSync().type == FileSystemEntityType.file)
      files.add(fse.path);
  });
  String zipfile = '${Directory.current.path}/comprimido.zip';

  zip(files, zipfile);

  unzip(zipfile, '${Directory.current.path}/descomprimido');
}
//**************************Comprimindo o arquivo******************************
void zip(List<String> files, String file){
  //-----------------Criando uma copia dos arquivos desejados-----------------
  Archive archive = Archive(); //Declarando um arquivo / diretorio de arquivos (RAM)
  files.forEach((String path) {
    File file = File(path); //Setando o arquivo da List files
    //Declarar um arquivo file (na RAM) que será uma copia do file acima
    ArchiveFile archiveFile = ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());
    //Salvando o arquivo copia no diretório de arquivos
    archive.addFile(archiveFile);
  });

  //-------------------Comprimindo os itens copias-----------------------------
  //Criando um novo arquivo File de endereço file na RAM
  //Passando para a memoria interna quando escrito
  //É escrito no File todos os itens salvos no diretorio archive (virtual) de forma comprimida
  File(file).writeAsBytesSync(ZipEncoder().encode(archive));

  print('Comprimido Com Sucesso!');
}

//************************* Descomprimindo arquivos ****************************
void unzip(String zip, String path){
  File file = File(zip);
  Archive archive = ZipDecoder().decodeBytes(file.readAsBytesSync());

  archive.forEach((ArchiveFile archivefile) {
    File file = File(path+'/'+archivefile.name);
    file.createSync(recursive: true);
    file.writeAsBytesSync(archivefile.content);
  });
  print('Arquivo Descomprimido!');
}
