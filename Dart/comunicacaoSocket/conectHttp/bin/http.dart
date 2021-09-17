import 'package:http/http.dart' as http;
void main() async{
  //Pegando dados da web
  var url = Uri.parse('https://httpbin.org/forms/post');
  var response = await http.get(url);
  print('O servidor respondeu com código de status: ${response.statusCode}');
  print('O corpo da requisição é: ${response.body}');

  //Postando dados na web
  print('**************************************** Post ****************************************************');
  var response1 = await http.post(url, body: 'nome = Leo&idade=20');
  print('O corpo da requisição é: ${response.body}');

}