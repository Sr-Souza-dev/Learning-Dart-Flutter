import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Cliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('img/detalhe_cliente.png', fit: BoxFit.cover,),
                Text(
                  'Nossos Clientes',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
                )
              ],
            ),
            Image.asset('img/cliente1.png', fit: BoxFit.cover,),
            Text(
              'Empresa de Software',
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.justify,
            ),
            Image.asset('img/cliente2.png', fit: BoxFit.cover,),
            Text(
              'Empresa de Auditoria',
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