import'package:http/http.dart' as http;
import'dart:convert';
import'dart:io';
void main() {
  menu();
}

void menu(){
  print('##################### ÍNICIO ####################');
  print('\nSelecione uma das opções abaixo');
  print('[1] - Ver a cotação de hoje');
  print('[2] - Registrar a cotação de hoje');
  print('[3] - Carregar os dados do arquivo');

  String option = stdin.readLineSync();
  switch(int.parse(option)){
    case 1:
      today();
      break;
    case 2:
      registerData();
      break;
    case 3:
      readData();
      break;
    default:
      print('\n\n Opção inválida! Selecione uma opção válida.');
      menu();
      break;
  }
}
void readData(){
  Directory dir = Directory.current;
  dynamic data = readFile();
  data = (data != null && data.length > 0 ? json.decode(data) : []);
  data.forEach((value){
    print(value['date']);
    print(value['data']);
  });

}
void registerData() async{
  var hgDate = await getData();
  dynamic fileData = readFile();
  fileData = (fileData != null && fileData.length > 0 ? json.decode(fileData) : []);
  bool exists = false;
  fileData.forEach((data) {
    if(data['date'] == now()){
      exists = true;
    }
  });
  if(!exists){
    fileData.add({"date" : now(), "data" : "${hgDate['data']}"});
    Directory dir = Directory.current;
    File file = File(dir.path + '/finance.txt');
    RandomAccessFile raf = file.openSync(mode: FileMode.write);
    raf.writeStringSync(json.encode(fileData));
    raf.flushSync();
    raf.closeSync();
    print('Dados Salvos com Sucesso!');
  }else{
    print('\nJá existe um dado financeiro de hoje cadastrado! \n');
  }
}
void today() async{
  var data = await getData();
  print('\n\n##################### HG Brasil - COTAÇÃO #####################');
  print('Data: ${data['date']}');
  print('${data['data']}');
}
Future getData() async{
  var url = Uri.parse('https://api.hgbrasil.com/finance/quotations?key=1bd82ded');
  http.Response response = await http.get(url);
  //verificando se o link foi aberto com sucesso
  if(response.statusCode == 200){
    var data = json.decode(response.body)['results']['currencies'];
    var usd = data['USD'];
    var btc = data['BTC'];
    var aud = data['AUD'];

    Map formatedMap = Map();
    formatedMap['date'] = now();
    formatedMap['data'] = '${usd['name']}, ${usd['buy']} \n${btc['name']}, ${btc['buy']} \n${aud['name']}, ${aud['buy']} \n';
    print(data);
    return formatedMap;
  }else{
    throw('Falhou!');
  }
}
String now(){
  var now = DateTime.now();
  return '${now.day.toString().padLeft(2,'0')} / ${now.month.toString().padLeft(2,'0')} / ${now.year.toString().padLeft(2,'0')}';
}
String readFile(){
  Directory dir = Directory.current;
  File file = File(dir.path + '/finance.txt');
  if(!file.existsSync()){
    print('Arquivo não encontrado!');
    return null;
  }
  return file.readAsStringSync();
}
