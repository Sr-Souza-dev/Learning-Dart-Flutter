class Person {
  //--------------------------atribtos da Class---------------------------------
  //publicos (podem ser acessados por qualquer outra função fora da class)
  String name = '';
  //privados (necessitam de get e set para que possam ser acessados por outras funções fora da class)
  int _age = 0;
  double _height = 0;
  /*
    Atributo estatico não podem ser acessador por uma instancia
    São atributos que tem o mesmo valor para qualquer instancia da class
    Oculpa somente um endereço de memorica durante toda a execução
  */
  static int qtdPeople = 0;

  //------------------------------Construtores-----------------------------------
  Person();
  Person.complete(String name, int age, double height) {
    this.name = name;
    this.age = age;
    this._height = height;
    qtdPeople++;
  }
  /*
  Person(this.name, this._age, this._height);
  Este construtor comentado faz a mesma coisa que o primeiro so que de forma reduzida
  */
  //Construtor personalizado
  Person.basic(this.name) {
    print('Uma pessoa com foi cadastrada com somente o nome');
    qtdPeople++;
  }
  //--------------metodos Set e Get (Atributos privados)-----------------------
  /*
    O set e get em dart é capaz de definir um 'apelido' para os metodos privados
    toda vez que o apelido é utilizado em qualquer outra função, os metodos
    get  e set tb serão chamados e realizarão o procedimento descrito
  */
  void set age(int age) => _age = age * 2;
  int get age => _age;

  void set height(double height) => _height = height + 0.03;
  double get height => _height;

  //--------------------------Metodos genericos---------------------------------
  void birthday() {
    age++;
  }

  void sleep() {
    print('$name está dormindo');
  }

  //utilizando o this para expecificar que o 'age' utilizado é o atributo da class e não o parametro do metodo
  String compareFriendsAges(age) {
    return this.age < age
        ? 'Fried é mais velho'
        : this.age == age
            ? 'Tem a mesma idade'
            : 'Você é mais velho que o friend';
  }
}
