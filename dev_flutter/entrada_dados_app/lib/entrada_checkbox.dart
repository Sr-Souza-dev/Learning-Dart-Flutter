import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool? _isChecked = false;
  bool? _isListChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('CheckBox'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('CheckBox Simples'),
            Checkbox(
              value: _isChecked,
              onChanged: (bool? valor){
                print('Checkbox $valor');
                setState(() {
                  _isChecked = valor;
                });
              },
              activeColor: Colors.pinkAccent,
            ),
            CheckboxListTile(
              title: Text('Pode-se adcionar um titulo ao checkBox'),
              subtitle: Text('ListChecked'),
              activeColor: Colors.green,
              value: _isListChecked,
              selected: false,
              secondary: Icon(Icons.add_alarm),
              onChanged: (bool? valor){
                setState(() {
                  _isListChecked = valor;
                });
              },
            ),
            ElevatedButton(
              child: Text('Salvar'),
              onPressed: (){
                print('Check1: $_isChecked; ListChecked: $_isListChecked');
              },
            ),
          ],),
      ),
    );
  }
}
