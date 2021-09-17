import 'AnimalFactory.dart';

main() {
  var animal1 = AnimalFactory();
  print(animal1.nome);
  animal1.nome = 'Duck';
  print(animal1.nome);

  var animal2 = AnimalFactory();
  print(animal2.nome);
  animal2.nome = 'Bob';
  print(animal1.nome);
  print(animal2.nome);

  AnimalFactory.instancia.nome = 'Dog';
  print(AnimalFactory.instancia.nome);
}
