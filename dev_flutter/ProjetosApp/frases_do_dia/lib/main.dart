import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}


class HomeStateful extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomeStateful> {
  var _frase = [
    'Gratidão não é paga, mas um reconhecimento que se demonstra no dia a dia.',
    'Todos os seus medos deixe Deus sarar!',
    'A vida foi feita para ser vivida a cada instante com Amor',
    'Ame quem te ama e seja feliz com seu amor!'
  ];
  int _aux = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frase do dia!"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Padding(
              padding: EdgeInsets.all(30),
              child: Image.asset(
                "img/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                _frase[_aux],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
              ),
              child: Text(
                  'Nova Frase',
                  style: TextStyle(
                    fontSize: 25,
                  ),
              ),
              onPressed: (){
                setState(() {
                  _aux = Random().nextInt(4);
                });
              },
            ),]
        ),
      )
    );
  }
}


