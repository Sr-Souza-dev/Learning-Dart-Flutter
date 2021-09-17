import 'dart:io';
import 'dart:convert';

main() {
  //***************** IDENTIFICANDO O SISTEMA OPERACIONAL *********************/
  print('SO: ${Platform.operatingSystem}  | Versão: ${Platform.version}');
  if (Platform.isWindows) {
    print('Rodando código Windows');
  } else if (Platform.isLinux) {
    print('Rodando código Linux');
  } else if (Platform.isMacOS) {
    print('Rodando código no OSX');
  } else {
    print('O código esta sendo executado!');
  }

  print('\n#################################################################');
  //***************** ENCONTRANDO O CAMINHO DO CODIGO *********************/
  print('Path: ${Platform.script.path}');
  print('Path: ${Platform.executable}');

  print('\n#################################################################');
  //**************** LISTANDO VARIAVEIS DE AMBIENTE DO SO ********************/
  print('Variáveis de ambiente: ');
  Platform.environment.keys
      .forEach((key) => print('$key -> ${Platform.environment[key]}'));

  print('\n#################################################################');
  //************************* RODANDO PROCESSOS ******************************/
  //abrindo o bloco de notas
  Process.run('C:/windows/System32/notepad.exe', [])
      .then((ProcessResult results) => print(results.stdout));

  print('\n#################################################################');
  //********************* COMUNICANDO COM PROCESSOS **************************/
  Process.start('cat', []).then((Process processo) {
    processo.stdout.transform(utf8.decoder).listen((data) {
      print(data);
    });
    processo.stdin.writeln('Olá Mundo!');
    Process.killPid(processo.pid);
  });
}
