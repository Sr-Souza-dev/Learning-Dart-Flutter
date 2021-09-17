main() {
  Person.instancia.name = 'Gabriel';
  print(Person.instancia.name);

  Person person1 = Person.instancia;
  Person pessoa2 = Person.instancia;

  /*
    Independente da quantidade de instancias, Person terá somente uma unica 
    instancia (está sendo criado varios caminhos para o mesmo endereço de memória)
    caso seja alterado o nome em qualquer instancia, também será alterado nas outras,
    pois elas referenciam o mesmo endereço de memoria
  */
  person1.name = 'Lucas';
  print(person1.name);
  pessoa2.name = 'Rodolfo';
  print(pessoa2.name);

  print(Person.instancia.name);
}

/*
  'singletons' é quando você define uma class que pode ter somente uma instancia,
  ou seja, ela é estatica e pode-se haver apenas um unico endereço de memoria para 
  manipular seus dados
*/
class Person {
  static final Person instancia = new Person._construtorNomeado();
  String name = '';

  Person._construtorNomeado();
}
