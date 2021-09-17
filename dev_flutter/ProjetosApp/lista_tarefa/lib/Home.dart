import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; //Encontra os caminho de dados tanto no IOS quanto no Android
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _tarefas = [];
  Map<String,dynamic> _ultimaTarefa = Map();

  /*
  Future<File> _getFile()async{
    Directory diretorio = await getApplicationDocumentsDirectory();
    //Criando o arquivo caso ele não exista
    return File(diretorio.path + '/dados.json');
  }

  //Metodos para salvar os dados em um arquivo
  _salvarArquivo()async{
    var arquivo = await _getFile();


    //Adcionando ao arquivo
    String dados = json.encode(_tarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async{
      final arquivo = await _getFile();
      return arquivo.readAsString();
  }

  @override
  void initState() {
    super.initState();
    //_salvarArquivo();
    _lerArquivo().then((dados){
      setState(() {
        _tarefas = json.decode(dados);
      });
    });
  }
*/

  //Definindo função para o click no floatingButton
  _onPressedFloatButton(){
    TextEditingController controle = TextEditingController();
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Adcionar Tarefa'),
            content: TextField(
              decoration: InputDecoration(
                labelText: 'Digite sua tarefa'
              ),
              controller: controle,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar')
              ),
              TextButton(
                  onPressed: (){
                    //Salvando nova tarefa
                    Map<String,dynamic> ultimaTarefa = Map();
                    ultimaTarefa['titulo'] = controle.text;
                    ultimaTarefa['realizada'] = false;
                    setState(() {
                      _tarefas.add(ultimaTarefa);
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Salvar')
              ),
            ],
          );
        }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefa'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //Se utilizar o FloatingActionButton.extended() é possivel adcionar um label
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white70,
        elevation: 20,
      ),*/
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _onPressedFloatButton(),
        icon: Icon(Icons.note_add),
        label: Text('Adicionar'),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white70,
        elevation: 20,
      ),

      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(), (é utilizado somente para floating circulares)
        child: Row(children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu),
          ),
        ],),
        color: Colors.purple[200],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                    itemBuilder: (context,index) {
                      return Dismissible(
                          key: Key(_tarefas[index]['titulo'] + DateTime.now().microsecondsSinceEpoch.toString()),
                          background: Container(
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                            ],),
                          ),
                         // secondaryBackground: Container(color:Colors.green),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction){
                            _ultimaTarefa = _tarefas[index];
                              if(direction == DismissDirection.endToStart){
                                setState(() {
                                  _tarefas.removeAt(index);
                                });

                                final snackbar = SnackBar(
                                  content: Text('Tarefa Removida'),
                                  duration: Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: "Desfazer",
                                    onPressed: (){
                                      setState(() {
                                        _tarefas.insert(index,_ultimaTarefa);
                                      });
                                    },
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                          },
                          child: CheckboxListTile(
                            title: Text(_tarefas[index]['titulo'], style: TextStyle(fontSize: 20),),
                            value: _tarefas[index]['realizada'],
                            onChanged: (valorAlterado){
                              setState(() {
                                _tarefas[index]['realizada'] = valorAlterado;
                              });
                            },
                          ),
                      );
              }),
            ),
        ],)
      )
    );
  }
}
