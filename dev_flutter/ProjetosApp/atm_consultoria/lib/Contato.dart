import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('img/detalhe_contato.png', fit: BoxFit.cover,),
                Text(
                  'Contato',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                )
              ],
            ),
            Text(
              'E-mail: consultoria@atm.com.br \n\nTelefone (37) 3333-2222 \nCelular: (37) 9999-8888',
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.justify,
            ),
          ],),
      ),
    );
  }
}