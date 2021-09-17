import 'person.dart';
import 'student.dart';

void main() {
  //----------------------Declarando com construtores------------------------
  //declarando uma pessoa utilizando o construtor padrão
  Person pessoa3 = Person();
  print(pessoa3);
  //declarando uma pessoa utilizando o construtor personalizado
  Person pessoa1 = Person.complete('Gabriel', 20, 1.79);
  Person pessoa2 = Person.basic('Rodolfo');

  //----------------------Utilizando atributos Publicos--------------------
  pessoa1.name = 'Gabriel de Souza'; //Definindo valores para atributos publicos
  pessoa2.name = 'Rodolfo Martins'; //Definindo valores para atributos publicos
  print(pessoa1.name); //Imprimindo atributos publicos
  print('Nome (Pessoa 2): ${pessoa2.name}'); //IMprimindo atributos publicos

  //------------Utilizando atributos privados por get e set-------------------
  pessoa1.age = 5; //Metodo 'set age' utilizado
  print('Idade (Pessoa1): ${pessoa1.age}'); //Metodo 'get age' utilizado
  pessoa1.height = 1.75; //Metodo 'set height' utilizado
  print('Altura (Pessoa1): ${pessoa1.height}'); //Metodo 'get height' utilizado

  //---------------------Utilizando metodos genericos-------------------------
  pessoa1.birthday();
  print(pessoa1.compareFriendsAges(22));

  //------------------trabalhando com atributos estaticos----------------------
  print(Person.qtdPeople);

  //------------------------TRABALHANDO COM HERANÇA---------------------------
  print('---------------------TRABALHANDO COM HERANÇA------------------------');
  Student student1 = Student('Gabriel Souza', '121564');
  student1.age = 20;
  student1.height = 1.79;
  print('Nome: ${student1.name}');
  print('CPF: ${student1.cpf}');
  print('Idade: ${student1.age}');
}
