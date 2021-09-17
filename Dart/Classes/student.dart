import 'person.dart';

/*
  Para poder utilizar a herança, a class 'Pai' precisa tem um construtor vazio
*/
class Student extends Person {
  String _cpf = '';

  Student(String name, this._cpf) : super.basic(name); //Construtor com herança

  void set cpf(cpf) => _cpf = cpf;
  String get cpf => _cpf;

  //Utilizando a sobrecarga para redefinir o metodo
  void sleep() {
    print('O Estudante está dormindo');
    super.sleep(); // para acessar o metodo sleep da class pai
  }
}

class BastStudent extends Student {
  //Vai herdar os atributos de 'Student' e 'Person'
  BastStudent(String name, String cpf) : super(name, cpf);
}

class Administrador {
  //Class 'Pai 2'
}

class Monitor extends Person with Administrador {
  //Class herdada de duas outras classes 'Person' e 'Administrador'
}
