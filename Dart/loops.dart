main() {
  print('-------------------------Loops Basicos------------------------------');
  //Loop for precisa de um contador e se repete até que a condição não seja mais atendida
  for (int i = 1; i < 5; i++) {
    print('Cont For: $i');
  }

  //Loop while repete se a operação logica dentro dele for verdadeira (ira entrar somente se for verdadeiro a primeira instância)
  int j = 0;
  while (j < 4) {
    j++;
    print('Cont While: $j');
  }

  //Loop do while repete pelo menos uma vez e volta ao loop se a operação logica no while for verdadeira
  int k = 0;
  do {
    k++;
    print('Cont Do-While: $k');
  } while (k < 4);

  print('-------------------------Loops Avançados---------------------------');
  /*
    Os loops avançados aparentemente não são capazes de alterar as variaveis 
    Originais, ficando mais eficientes somente para  aimpressão de itens
  */
  //Loop for each é uma função que pode ser chamada por listas, fila e map e requer uma function com um parametro
  List people = ['Gabriel', 'Lucas', 'Daniel', 'Luiz', 'Miguel', 'Renan'];
  people.forEach((person) => print(person));

  //Loop for in um laço que percorre toda estrutura por uma unica variavel
  List frutas = ['Maçã', 'banana', 'Mamão', 'Laranja', 'Pêra', 'Manga'];
  for (String fruta in frutas) {
    print(fruta);
  }
}
