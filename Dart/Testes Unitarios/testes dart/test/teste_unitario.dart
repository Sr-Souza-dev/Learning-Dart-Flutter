import 'package:test/test.dart';
void main(){
  //criando um grupo para testar string <group(descrição,arrowFunction)>
  group('String',(){
    //testando a função split
    test('Descrição do teste (divide a string no delimitador)', (){
      String text = 'Gabriel,Daniele,Nubia';
      expect(text.split(','), equals(['Gabriel','Daniele','Nubia']));
    });
  });
}