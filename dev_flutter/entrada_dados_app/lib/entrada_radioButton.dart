import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {
  //O tipo da variavel deve ser o msm do value do radio
  String? _escolhaUserSexo = '';
  String? _escolhaSexoRadioStTile = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.add),
            Text('Radio Button')],
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: [
            Row(children: [
                Radio(
                    value: 'm',
                    groupValue: _escolhaUserSexo,
                    onChanged: (String? escolha){
                      setState(() {
                        _escolhaUserSexo = escolha;
                      });
                      print(escolha);
                    },
                ),
                Text('Masculino'),
                Radio(
                    value: 'f',
                    groupValue: _escolhaUserSexo,
                    onChanged: (String? escolha){
                      setState(() {
                        _escolhaUserSexo = escolha;
                      });
                      print(escolha);
      }
                ),
                Text('Feminino'),],
            ),
            Column(children: [
              RadioListTile(
                title: Text('Masculino'),
                  subtitle: Text('Homens'),
                  secondary: Icon(Icons.handyman),
                  value: 'man',
                  groupValue: _escolhaSexoRadioStTile,
                  onChanged: (String? escolha){
                    setState(() {
                      _escolhaSexoRadioStTile = escolha;
                    }
              );
                }),
              RadioListTile(
                  title: Text('Feminino'),
                  subtitle: Text('Mulheres'),
                  secondary: Icon(Icons.pregnant_woman),
                  value: 'woman',
                  groupValue: _escolhaSexoRadioStTile,
                  onChanged: (String? escolha){
                    setState(() {
                      _escolhaSexoRadioStTile = escolha;
                    });
                  }
              ),
            ],),
            ElevatedButton(
              child: Icon(Icons.save),
              onPressed: (){
                print(_escolhaSexoRadioStTile);
              },
            )


          ],
        ),
      ),
    );
  }
}
