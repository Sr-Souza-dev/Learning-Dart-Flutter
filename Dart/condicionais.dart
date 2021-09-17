import 'dart:io';

main() {
  print('Qual é a sua idade? ');
  dynamic entrada = (stdin.readLineSync());
  int age = int.parse(entrada);
  print(age);

  //Condicionais por if e else
  if (age == 23) {
    print('Você tem 23 Anos (if-else)');
  } else if (age == 20) {
    print('Você tem 20 anos (if-else)');
  } else {
    print('Você não tem 23 e nem 20 anos (if-else)');
  }

  //Condicionais por Operadores Ternarios (também podemos estender as condições)
  print(age == 23 ? 'Você tem 23 anos (ternario)' : 'Você não tem 23 anos (T)');
  print(age == 20
      ? 'Você tem 20 anos'
      : age < 18
          ? 'Você é menor de idade'
          : 'Você não é menor de idade e nem tem 23 anos');

  //Condicionais por switch
  switch (age) {
    case 20:
      print('Vocé tem 20 anos (switch)');
      break;
    case 18:
      print('Parabéns, você é maior de idade (switch)');
      break;
    case 105:
      print('Parebens, se alimentou bem! (switch)');
      break;
    default:
      print('Nenhuma idade especial (switch)');
      break;
  }
}
