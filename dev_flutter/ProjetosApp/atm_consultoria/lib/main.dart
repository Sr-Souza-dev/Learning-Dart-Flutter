import 'package:atm_consultoria/Contato.dart';
import 'package:atm_consultoria/Servico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Cliente.dart';
import 'Empresa.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATM Consultoria'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('img/logo.png',fit: BoxFit.cover),
            Padding(
                padding:EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Empresa())
                        );},
                      child: Image.asset("img/menu_empresa.png",fit: BoxFit.cover),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Servico())
                        );},
                      child: Image.asset("img/menu_servico.png",fit: BoxFit.cover),
                    ),
                  ],
                ),
            ),
            Padding(
              padding:EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cliente())
                      );},
                    child: Image.asset("img/menu_cliente.png",fit: BoxFit.cover),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contato())
                      );},
                    child: Image.asset("img/menu_contato.png",fit: BoxFit.cover),
                  ),
                ],
              ),
            ),

        ],),
      ),
    );
  }
}

