import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controlerCep = TextEditingController();
  dynamic result = '';
  Map<String, dynamic> retorno = {};

  _recuperarCep(cep)async{
    var url = Uri.parse('http://viacep.com.br/ws/' + cep + '/json/');

    http.Response response;
    //puxando dados da pagina web
    response = await http.get(url);

    if(response.statusCode == 200){
      //convertendo a string para o formato Json (Map)
      retorno = json.decode(response.body);
      if(retorno['erro'] != true){
        setState(() {
          result = 'Bairro: ${retorno['bairro']} \n${retorno['logradouro']}\nCidade: ${retorno['localidade']}\nEstado: ${retorno['uf']}';
        });}
      else{
        setState(() {
          result = 'Cep inválido!';
        });}
    }
    else{
      setState(() {
        result = 'Cep inválido!';
      });}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Serviço web'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: SingleChildScrollView(
          child:  Column(children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite Seu cep"),
              style: TextStyle(
                  fontSize: 25
              ),
              controller: _controlerCep,
            ),
            ElevatedButton(
              child: Text('Resgatar Api'),
              onPressed: () => _recuperarCep(_controlerCep.text),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                '$result',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],),
        )
      ),
    );
  }
}
