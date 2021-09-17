import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHome(),
  ));
}
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _result = '';

  void _calcular(){
    var valueAlcool = double.parse(_controllerAlcool.text);
    var valueGasolina = double.parse(_controllerGasolina.text);
    setState(() {
      if(valueAlcool < valueGasolina * 0.7)
        _result = 'Melhor Abastecer Álcool!';
      else
        _result = 'Melhor Abastecer Gasolina!';
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Álcool ou Gasolina'),
      ),
      body: Container(
        child: SingleChildScrollView( //Utilizado para evitar overflow da tela
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //Todos itens ocupam 100% de width
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
                child: Column(children: [
                  Image.asset("img/logo.png", fit: BoxFit.cover,),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: Text(
                        "Saiba qual a melhor opção para abastecimento do seu veiculo",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Preço Álcool, Ex: 1.36'
                    ),
                    style: TextStyle(
                        fontSize: 20
                    ),
                    controller: _controllerAlcool,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Preço Gasolina, Ex: 3.89'
                    ),
                    style: TextStyle(
                        fontSize: 20
                    ),
                    controller: _controllerGasolina,
                  ),

                ],),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: ElevatedButton(
                      child: Text(
                        'Calcular',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      ),
                      onPressed: _calcular
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  _result,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      )

    );
  }
}

