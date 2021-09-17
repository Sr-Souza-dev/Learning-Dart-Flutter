import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor = '';
  _atualizarBtc()async{
    http.Response response;
    response = await http.get(Uri.parse("https://blockchain.info/ticker"));
    if(response.statusCode !=200)
      return;
    Map<String,dynamic> result = json.decode(response.body)['USD'];
    setState(() {
      _valor = 'R\$ ${result['buy']}';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("img/bitcoin.png", fit: BoxFit.cover,),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: Text(
                    _valor,
                  style: TextStyle(
                    fontSize: 28
                  ),
                ),
              ),
              ElevatedButton(
                child: Text(
                    'Atualizar',
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: _atualizarBtc,
              )
            ],
          ),
        ),
    );
  }

}
