import 'dart:io';

main() {
  //-----------------Verificando se um diretorio existe--------------------
  String path = 'C:/Users/gabri'; //Salvando o endereço de um diretorio
  Directory dir = Directory(path); //definindo o endereço do diretorio

  if (dir.existsSync()) {
    print('O Diretório Existe!');
  } else {
    print('O diretório não foi encontrado!');
  }

  print('\n###############################################################');
  //*CRIANDO E REMOVENDO UM DIRETORIO NO SISTEMA DE ARQUIVOS TEMPORARIOS (temp)*
  dir = Directory.systemTemp.createTempSync(); //Criando o diretório
  print(dir.path); //mostrando o caminho

  if (dir.existsSync()) {
    print('Removendo ${dir.path}');
    dir.deleteSync(); //Removendo o diretório
  } else {
    print('Não foi Possivel encontrar o Diretorio ${dir.path}');
  }

  print('\n###############################################################');
  //**********LISTANDO ITENS E DETALHANDO OS DADOS DE UM DIRETÓRIO************
  Directory dir1 = Directory.current; //Definindo o diretório atual
  print(dir1.path);
  //criando uma lista com todos endereços/caminho de cada arquivo do diretório
  //recursive: true => faz com que até os arquivos dentro das pastas sejam adicionados
  //recursive: false => É adicionado somente os itens do diretório
  List<FileSystemEntity> list = dir1.listSync(recursive: false);
  print(list.length);
  //Varrendo todos os endereços salvos na lista
  list.forEach((FileSystemEntity value) {
    FileStat stat = value.statSync(); //Pegando os dados de cada var 'value'
    print('\nPath: ${value.path}');
    print('Tipo: ${stat.type}');
    print('Alterado em: ${stat.changed}');
    print('Acessado em: ${stat.accessed}');
    print('Modo de permissão: ${stat.mode}');
    print('Tamanho: ${stat.size} bytes');
  });

  print('\n###############################################################');
  //***************************LENDO UM ARQUIVO*****************************
  Directory dir2 = Directory.current; //Definindo o diretório atual
  print('Diretório que estamos: ${dir2.path}');
  File file1 = File(dir2.path + '/meu_arquivo.txt');
  readFile(file1);

  print('\n###############################################################');
  //*************************ESCREVENDO EM UM ARQUIVO**************************
  //Vamos utilizar o mesmo arquivo do exemplo anterior
  writeFile(file1);
  print(file1.readAsStringSync());
}

//*************************ESCREVENDO EM UM ARQUIVO**************************
//Quando o arquivo não existe ele cria um novo
void writeFile(File file1) {
  //Abrindo o arquivo para escrita
  RandomAccessFile raf = file1.openSync(mode: FileMode.write);
  //Escrevendo de forma sincrona no arquivo (enquanto não acabar ele não é liberado)
  raf.writeStringSync('Olá Mundo!\r\nComo você está hoje?');
  raf.flushSync(); //Liberando o arquivo da cash
  raf.closeSync(); //Fechando o arquivo
}

//*************************FUNÇÃO LENDO UM ARQUIVO*****************************
void readFile(File file1) {
  if (!file1.existsSync()) //Verificando se o arquivo existe
  {
    print('Arquivo não encontrado');
    return;
  }
  print('Iniciando a leitura');
  print(file1.readAsStringSync()); //Salva todas linha do arquivo em uma string
  //salvando cada linha como uma posição da lista
  List linha = file1.readAsStringSync().split('\r\n');
  print(linha);
}
