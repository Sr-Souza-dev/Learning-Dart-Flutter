main() async {
  //Funções basicas
  test();
  print('57 centimetro é igual a ${convert(57)} metros');

  //Funções com parametro Opcionais
  print('Soma: ${soma(5, 4, 4)}');
  print('Soma: ${soma(5, 4)}');
  now('Gabriel', true);

  //Funções com parametros nomeados
  personData(
      weight: 80.59, name: 'Gabriel', age: 18, height: 1.85, skin: 'Negro');

  //Função como objeto (uma variavel recebe uma função)
  var CentimetersToMeters = converter;
  print('Centimetros para metros: ${CentimetersToMeters(200, 100)} m');

  //Função Anônima ( ()=>... ou () {} )
  createButton('Button', () {
    print('Botão Criado com Sucesso (function anonima)!');
  });

  //Função Assincrona (Executa de forma fifo)
  load();
  print(await load2()); //Espera o retorno da função (main deve ser async)
  load1();

  /*
    Clousures são funções dentro de outras funções
    Elas seguem as regras de escopo
  */
}

//Funções basicas
test() {
  print('Este é um teste!');
}

double convert(int centimetros) {
  return centimetros / 100;
}

//Funções com parametro Opcionais (Basta envolver com colchetes os desejados com um valor default)
int soma(int num1, [int num2 = 1, int num3 = 1]) {
  return (num1 + num2 + num3);
}

void now(String text, [bool time = false]) {
  var now = new DateTime.now();
  if (time) {
    String formatTime = ', a hora atual é: ${now.hour}:${now.minute}';
    print(
        'Olá $text, hoje é dia: ${now.day}/${now.month}/${now.year}$formatTime');
  }
}

//Funções com parametros nomeados (Os parametros tem um valor default e podem ser passados em qualquer ordem na main)
void personData(
    {String name = 'desconhecido',
    double weight = 50.3,
    double height = 1.50,
    String skin = 'Negro',
    int age = 15}) {
  print('$name tem $age anos, $weight Kilos, $height Metros e cor $skin');
}

//Função como objeto (ajuda na leitura de codigo para funções genericas)
num converter(num number, num scale) {
  return number / scale;
}

//Função Anônima (o exemplo abaixo recebe uma função anonima criada na main)
void createButton(String text, Function criandoFuncao,
    {String color = 'Preto', double wight = 1}) {
  print(text);

  criandoFuncao();
}

//Função Assincrona (async) cria funções fora da leitura que serão exibidas após terminarem determinada tarefa
//await diz que a linha de código deve ser carregada antes de continuar
void load() async {
  await Future.delayed(const Duration(seconds: 3)); //Eperando 3 segundos
  print('Carregou Load 0');
}

void load1() async {
  print('Carregou Load 1');
}

load2() async {
  await Future.delayed(const Duration(seconds: 1)); //Eperando  segundos
  return 'Carregou Load 2';
}
