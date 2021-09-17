import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePreference extends StatefulWidget {
  const HomePreference({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePreference> {
  String _textSalve = 'Nada Salvo!';
  TextEditingController _controllerCampo = TextEditingController();

  _salvar()async{
    String valorDigitado = _controllerCampo.text;

    final preferencias = await SharedPreferences.getInstance();
    await preferencias.setString('nome', valorDigitado);

  }
  _recuperar()async{
    final preferencias = await SharedPreferences.getInstance();
    setState(() {
      _textSalve = preferencias.getString('nome') ?? 'Sem Valor';
    });
  }
  _remover()async{
    final preferencias = await SharedPreferences.getInstance();
    preferencias.remove('nome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manipulação de dados'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(children: [
          Text(
            _textSalve,
            style: TextStyle(fontSize: 20),
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: _controllerCampo,
            decoration: InputDecoration(
              labelText: 'Digite Algo'
            ),
          ),
          Row(children: [
            ElevatedButton(
              child: Text('Salvar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              ),
              onPressed: () => _salvar(),
            ),
            ElevatedButton(
              child: Text('Recuperar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              ),
              onPressed: () => _recuperar(),
            ),
            ElevatedButton(
              child: Text('Remover'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              ),
              onPressed: () => _remover(),
            ),
          ],)
        ],),
      ),
    );
  }
}
