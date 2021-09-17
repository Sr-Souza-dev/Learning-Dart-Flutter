import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperarPreco() async{
    String url = "https://blockchain.info/pt/ticker";
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarPreco(),
      builder: (context, snapshot){
        String resultado = '';
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            print('Conexão waiting (Aguardando resposta)');
            resultado = 'Carregando...';
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            print('Conexão done (conexão bem sucedida)');
            if(snapshot.hasError){
              resultado = 'Erro ao carregar os dados!';
            }else{
              double valor = snapshot.data?["BRL"]["buy"];
              resultado = "Preço BTC: ${valor.toString()}";
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}
