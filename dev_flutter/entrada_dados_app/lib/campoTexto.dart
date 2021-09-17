import 'package:flutter/material.dart';

class CampoText extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CampoText> {
  //Criando variavel para controlar os itens inseridos na caixa de texto
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Entrada de dados'),
      ),
      body: Container(
        child: Column( children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //Tipo de entrada que será recebida
              //text, number, emailAddress, datetime...
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite um valor",
              ),
              //É o padrão e define se ca caixa de texto pode receber ou não informações
              enabled: true,
              maxLength: 3, //Maximo caracter que o campo pode receber
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              //Tem a propriedade de esconder o texto digitado caso seja true (utilizado em senha)
              obscureText: false,
              //os recursos iniciados com on... recebem um função passando o que esta sendo inserido como parametro
              onSubmitted: (String e){
                print('Valor digitado ' + e);
              },
              //Variavel para ser recuperada em outras funções
              controller: _textEditingController,
            ),
          ),
          ElevatedButton(
            child: Text("Salvar"),
            style:ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
            ),
            onPressed: (){
              print('O valor é ${_textEditingController.text} ! Adeus');
            },
          ),
        ],),
      ),
    );
  }
}
