import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  String valor = '';
  TelaSecundaria(this.valor);
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Color.fromRGBO(255, 138, 123, 0.5),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Text('Tela Secundaria \nNome ${widget.valor}')
        ],),
      ),
    );
  }
}
