import 'package:flutter/material.dart';
import 'TelaSecundaria.dart';

void main() {
  
  runApp(MaterialApp(
    //Nomeando rotas (outras telas)
    initialRoute: "/",
    routes: {
      "/secundaria" : (context) => TelaSecundaria('Daniele Rosa'),
    },
    home: TelaPrincipal(),
  ));
}
//Tela Principal
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
        child: Column(children: [
          ElevatedButton(
            child: Text('Segunda Tela'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              padding: MaterialStateProperty.all(EdgeInsets.all(15))
            ),
            onPressed: (){
              //Navegando entre telas
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaSecundaria('Gabriel Rosa')
                ),
                //A linha comentada abaixo faz a mesma coisa da de cima
                //onPressed:(){Navigator.pushNamed(context, "/secundaria");}
              );
            }
          ),
        ],),
      ),
    );
  }
}

