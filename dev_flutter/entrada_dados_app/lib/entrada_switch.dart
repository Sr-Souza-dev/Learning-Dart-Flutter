import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _resultSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.change_history),
            Text('Switch')],
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          children: [
            Row(children: [
              Switch(
                  value: _resultSwitch,
                  onChanged: (bool escolha){
                    setState(() {
                      _resultSwitch = escolha;
                    });
                  }
              ),
              Text('Receber Notificação? '),
            ],),
            SwitchListTile(
              title: Text('Receber Notificação?'),
                subtitle: Text('Serão enviadas às 7AM'),
                secondary: Icon(Icons.notifications),
                activeColor: Colors.green,
                value: _resultSwitch,
                onChanged: (bool escolha){
                  setState(() {
                    _resultSwitch = escolha;
                  });
                }
            )



         ]),
      )
    );
  }
}
