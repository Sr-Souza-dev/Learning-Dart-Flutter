import 'dart:io'; //Para poder interagir com o usuario

main() {
  //---------------------------Tipos númericos----------------------------------
  print('--------------------Tipos Numéricos------------------');
  int inteiro = 5; //Aceita somente valores inteiros
  double flutuante = 3.14; //Aceita somente valores fracionados
  num qualquerValor = 29; //Aceita qualquer valor Real

  print(inteiro);
  print(flutuante);
  print(qualquerValor);

  //conversão de tipos de string para númericos
  print('--------------------Conversão de tipos numéricos------------------');
  int convertI = int.parse('23'); //Convertendo string para inteiro
  double convertD =
      double.parse('13'); //Convertendo de string para double (decimal)
  print(convertI);
  print(convertD);

  //Captura de Erro
  print('--------------------Captura de Erros------------------');
  int erro = int.parse('12.23', onError: (source) {
    return 0;
  });
  //Retorna 0 caso a conversão não ocorra
  int erroSimplificado = int.parse('12.23', onError: (source) => 0);
  //Retorna 0 caso a conversão não ocorra
  print(erro);
  print(erroSimplificado);

  //Funções para variaveis numericas
  print('--------------------Funções para tipos númericos------------------');
  num numero = 3.15;
  print('Funções númericas');
  print(numero.round()); //Arredonda o valor passado para um inteiro
  print(numero.compareTo(3.15));
  //Compara o numero com 4 e retorna
  //-1 se for inferior, 0 se for igual e 1 se for superior
  print(numero.toInt()); //Desconsidera as casas decimais
  print(10.toDouble()); //Converte para double
  print(numero.toString()); //Converte para string
  print(numero.toStringAsFixed(1)); //Converte para string e considera 1 cs deci
  print(numero.isInfinite); //Verifica se o valor é infinito
  print(numero.truncate()); //Desconsidera as casas decimais
  print(numero.floor()); //Faz arredondamento para o inteiro mais próximo

  //------------------------------Tipo Boleanos----------------------------
  print('--------------------Tipo Boleano------------------');
  bool rich = true;
  print('Rico = $rich');
  rich = false;
  print('Você é ${rich ? 'Rico' : 'Pobre'}'); //Operador ternário (condicional)
  print(rich.runtimeType); //Retorna o tipo da Variavel

  //-------------------------------Tipo String-----------------------------
  print('--------------------Tipo String------------------');
  String name = 'Gabriel Souza';
  print('Meu nome é $name');
  name = 'Gabriel Souza' + "E Daniele"; //concatenando string
  var separado = name.split(' '); //Separa as strings pelo caracter '' (token)
  //O tipo var é indefinido sendo determinado pela primeira variavel recebida
  print('Primeiro nome: ${separado[0]}'); //PEgando a primeira palavra
  String nickName = name.substring(0, 4); //Pega da string da posição 0 ~ 4
  print(nickName);
  String soup = 'Sopa de letrinhas';
  int index = soup.indexOf(' de '); //Pega a posição incial da pedaço 'de'
  print('A sopa é: ${soup.substring(index).trim()}');
  //trim tira os espaços das extremidades
  print(soup.length); //Retorna a qtd de caracter
  print('Contém Daniele: ${name.contains('Daniele')}'); //Verifica se tem
  print('Soup: ${soup.toLowerCase()}'); //Converte tudo para letra minuscula
  print('Soup: ${soup.toUpperCase()}'); //Converte tudo para letra maiuscula
  print(soup.startsWith('G')); //Verifica se a string começa com 'G'
  print(soup.replaceAll('o', 'Gos')); // troca todo 'o' por 'Gos'
  print(soup.replaceFirst('a', 'GAb')); //troca somente o Primeiro 'o' por 'Gab'
  print(soup.replaceRange(1, 5, 'GAbriel')); //Substitui de 1 ~ 5 por 'GAbriel'

  //-------------------------Tipos Constantes------------------------
  print('--------------------Tipo Constante------------------');
  //Cria uma constante em tempo de compilação
  const pi = 3.14;
  print(pi);
  //Cria uma constante em tempo de Execução
  final gabr = 'GAbriel';
  print(gabr);

  //-------------------------Interação com o Usúario-----------------------
  print('--------------------Interação com o Usuario----------------------');
  print('Qual é o seu nome? ');
  var meuNome = stdin.readLineSync();
  print(meuNome);
}
