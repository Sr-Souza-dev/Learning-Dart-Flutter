import 'package:flutter/material.dart';
import 'TelaSecundaria.dart';

void main(){
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text("Ir para a segunda tela"),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaSecundaria()
                    )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


