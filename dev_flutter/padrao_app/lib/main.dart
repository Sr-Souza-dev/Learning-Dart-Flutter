import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
  Stateless -> Widgets que não podem ser alterados (Constantes)
  Stateful -> Widgets que podem ser alterados (variaveis)
*/

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}


//Criando um widget que pode ser alterado (variavel)
class HomeStateful extends StatefulWidget {
  @override
  _State createState() => _State();
}
//Cria um estado inicial para o app
class _State extends State<HomeStateful> {
  var _text = 'Gabriel Souza';

  @override
  Widget build(BuildContext context) {
    print('A interface foi atualizada');
    var _nameApp = 'First Project';

      return Scaffold(
        //Barra principal do app (NOrmalmente com o nome)
        appBar: AppBar(
          title: Text(_nameApp),
          backgroundColor: Colors.cyanAccent,
        ),
        body: Container(
          child: Column(
            children: [
              //Definindo um botão
              ElevatedButton(
                onPressed: (){
                  //Dizendo que eu quero atualizar algo na interface
                  setState(() {
                    _text = 'Curso Flutter';
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                ),
                child: Text('Click Aqui'),
              ),
              Text('Nome: $_text')
            ],
          ),
        ),
    );
  }
}


//Criando um widget Estatico/Constante (não pode ser alterado)
//Cada texto e botão não podem ser alterados
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _nameApp = "First Project";
    return Scaffold(
      //Barra principal do app (NOrmalmente com o nome)
      appBar: AppBar(
        title: Text(_nameApp),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Olá Mundo!'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyanAccent,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text('Texto 1'),
              Text('Texto 2'),
            ],
          ),
        ),
      ),

    );
  }
}




