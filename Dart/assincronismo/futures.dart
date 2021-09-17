import 'dart:io';

/*
  É uma promessa que deve ser concluida, executando em paralelo ao resto do 
  código há tarefas para serem executadas atraves do 'then' quando tal requisição for atendida
*/
main() {
  String path = Directory.current.path + '/teste.txt';
  File file = File(path); //Definindo um arquivo de caminho path

  //Criando uma promese de que o arquivo será aberto (append => leitura e escrita)
  Future<RandomAccessFile> f = file.open(mode: FileMode.append);
  //Quando o arquivo for aberto, executa a função dentro do then
  f.then((RandomAccessFile raf) {
    print('O Arquivo foi aberto');
    raf
        .writeString('Olá Mundo!') // Abrindo para escrita
        .then((value) {
          print('Arquivo escrito com sucesso!');
        }) //Quando abrir, executar a função no 'then'
        .catchError(() => print('Ocorreu um erro!')) //Se ocorrer um erro...
        .whenComplete(() => raf
            .close()); //quando acabar execute a função dentro do 'whenComplete'
  });
  print('#################### final #####################');
}
