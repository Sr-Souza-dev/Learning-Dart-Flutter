import 'package:flutter/material.dart';

class Servico extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Servico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
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
                Image.asset('img/detalhe_servico.png', fit: BoxFit.cover,),
                Text(
                  'Nossos Serviços',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent,
                  ),
                )
              ],
            ),
            Text(
              'Consultoria \n\nPreços \nAcompanhamento de projetos',
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