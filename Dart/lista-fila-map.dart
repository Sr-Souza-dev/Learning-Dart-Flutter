import 'dart:collection';

main(List<String> arguments) {
  //-------------------------DECLARANDO UMA LISTA-----------------------
  print('-------------------------DECLARANDO UMA LISTA-----------------------');
  List test = [1, 2, 3, 4, 5]; //Criando uma lista
  print(test.length); //Descobre o tamanho da lista
  print(test[2]);

  List things = []; //Criando uma lista generica vazia
  things.add(1); //Adcionando elementos a lista
  things.add('Gabriel');
  things.add(true);
  print(things);

  List<int> numbers = []; //Criando uma lista de inteiros (recebe somente int)
  numbers.add(1);
  numbers.add(4);
  numbers.add(15);
  print(numbers);

  List<String> texts = []; //Criando uma lista de strings
  texts.add('Olá Pessoas');
  texts.add('Gabriel Lindão');
  print(texts);

  /*
    'Set' é uma coleção desordenada que não aceita valores duplicados
    É um tipo de lista que não tem index e não aceita valores repetidos
  */
  Set<int> listSet = {};
  listSet.add(1);
  listSet.add(1);
  listSet.add(14);
  listSet.add(18);
  listSet.add(9);
  print(listSet);

  //----------------------------FUNÇÕES PARA LISTAS-------------------------
  print('--------------------------FUNÇÕES PARA LISTAS-----------------------');
  /*
      'every' testa todos os valores de acordo com a arrow function passada
      retornando true ou false de acordo com (valor1 && valor2 && valor3 && ...)
      A arrow function deve retornar um tipo boleano
  */
  //Testando se todos os valores da lista são maiores que 0 e se sim vai retornar true
  List<int> inteiros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool result = inteiros.every((elementos) => elementos > 0);
  print(result);
  //Testa todas as palavras e verifica se todas elas tem a letra a
  List<String> palavras = ['Gabriel', 'Deniel', 'Raquel', 'Daniele'];
  bool contem = palavras.every((palavra) => palavra.contains('a'));
  print(contem);

  /* 
    Maneiras de espandir uma lista
    expand -> transforma a matriz em uma unica lista
  */
  var lista = [
    [0, 1, 2, 3],
    ['Gabriel', 'Lucas', 'Rafael']
  ];
  List<dynamic> listaExpandida = lista.expand((elemento) => elemento).toList();
  print(listaExpandida);
  //É possivel concatenar listas de mesmo tipo
  List<num> numb = [1, 1.16, 2.2, 15, 1.6];
  List<double> flutuantes = [2.3, 3.5, 1.6, 9.4];
  List<dynamic> listaDinamica = [];
  listaDinamica = numb + inteiros;
  print(listaDinamica);
  //Ou tambem adcionar tipos diversis a mesma lista
  List<dynamic> diversa = []..addAll(numb)..addAll(flutuantes);
  print(diversa);

  /*
    Reduzir uma lista a um unico elemento 'reduce'
    reduce -> recebe uma função com dois argumentos sendo eles 'atual' e 'subsequente (proximo)'
    O valor do retorno (return) será o valor passado novamente como paremetro 'atual'
    exemplo: somando todos os valores da lista
  */
  List<int> numerosPares = List.generate(10, (i) => i * 2);
  print(numerosPares);
  int resultado = numerosPares.reduce((atual, proximo) {
    print('$atual, $proximo');
    return atual + proximo;
  });
  print(resultado);

  /*
    Filtrando uma lista de acorodo com um parametro 
    a função 'where' recebe uma function de um parametro com retorno boleano
    abaixo temos um exemplo de filtragem para somente números maiores que 15
  */
  List<int> idade = [10, 20, 30, 51, 45, 65, 78, 96];
  print(idade.where((a) => a > 15));

  //----------------------------Declarando uma fila---------------------------
  /*
    Fila é uma coleção ordenada, sem index, que adiciona e remove itens do inicio e do fim
    para conseguir utilizar é necessario importar o 'dart:collection'
  */
  print('---------------------------Declarando uma fila----------------------');
  Queue items = new Queue();
  items.add(1); //Adicionando item na fila de forma sequencial
  items.addFirst(0); //Adiciona na primeira posição da fila
  items.addLast(10); //Adciona na ultima posição da fila
  items.removeFirst(); //Remove a primeira posição da fila
  items.removeLast(); //Remove a ultima posição da fila
  items.removeWhere((element) => element == 1); //Remove em qualquer posição
  print(items);

  //----------------------------Declarando um Map---------------------------
  /*
    O map é um par de chave e valor (JSON) parecido com struct
    tal que o primeiro valor passado é uma chave e o segundo é salvo como valor
    Nos exemplos abaixo temos chaves como int e strings
  */
  print('---------------------------Declarando um MAP----------------------');
  Map<int, String> dds = new Map();
  dds[11] = 'São Paulo';
  dds[19] = 'Campinas';
  dds[21] = 'Rio de Janeiro';
  dds[37] = 'Minas Gerais';
  print(dds);

  Map<String, String> pessoas = new Map();
  pessoas['Gabriel'] = 'Gostosão';
  pessoas['Daniele'] = 'Minha Gostosona';
  pessoas['Nubia'] = 'Ex Gostosona';
  print(pessoas['Gabriel']);

  Map<String, dynamic> pessoa = Map();
  pessoa['Nome'] = 'Gabriel';
  pessoa['Idade'] = 20;
  pessoa['Altura'] = 1.78;
  print(pessoa);

  /*
    'putIfAbsent'
    Adiciona o elemento ao Map caso ele ainda não tenha sido add
    Ela recebe uma chave e uma função com algum retorno como parametro
  */
  Map<String, String> people = Map();
  people.putIfAbsent('Pai', () => 'Raimundo');
  people.putIfAbsent('Filho', () => 'Gabriel');
  people.putIfAbsent('Filha', () => 'Raquel');
  print(people);
  print(people.keys); //Imprime somente as chaves de um Map
  print(people.values); //Imprime somente os valores de um Map
  //FAzendo uma lista de map
  List BlocoPessoas = [];
  BlocoPessoas.add(pessoa);
  BlocoPessoas.add(pessoa);
  print(BlocoPessoas);
}
