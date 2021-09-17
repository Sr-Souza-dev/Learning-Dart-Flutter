import 'package:flutter/material.dart';
import 'BancoDadosClass.dart';

String tableName = 'notas'; 
String baseName = 'data';
String tableColumns = 'id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, subtitle TEXT, date VARCHAR';
String primaryKey = 'id';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listNote = [];
  BancoDados _dataBaseNotes = BancoDados(tableName, baseName, tableColumns, primaryKey);


  Future<List> _listNoteInit()async{
    List listTest = await _dataBaseNotes.pesquisar("id, title, subtitle, date");
    _listNote = [];
    for(var value in listTest){
      _listNote.add(value);
    }
    return _listNote;
  }


  _builderFuture(context, AsyncSnapshot<List> snapshot) {

    switch(snapshot.connectionState){
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Center(child: CircularProgressIndicator(),);

      case ConnectionState.active:
      case ConnectionState.done:
        if(!snapshot.hasData)
          return Center(child: Text('Nenhum dado a ser exibido!'),);

        return Container(
          padding: EdgeInsets.all(15),
          child: Column(children: [
            Expanded(child: ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 3, color: Colors.blue[100]),
              itemCount: _listNote.length,

              itemBuilder: (context,index){
                Map nota = _listNote[index];
                return Dismissible(
                    key: Key(DateTime.now().microsecondsSinceEpoch.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Icon(Icons.delete, color: Colors.white,)],
                      ),
                    ),
                    onDismissed: (direction){
                      setState(() {
                        _listNote.removeAt(index);
                      });
                      _dataBaseNotes.excluirRegistro(_listNote[index]['id']);
                    },

                    child: ListTile(
                      title: Text(nota['title'].toString()),
                      subtitle: Text(nota['subtitle'].toString()),
                    )
                );
              },
            ),),
          ],),
        );
    }
  }




  _onPressedButtonFloat(){
    TextEditingController controlerTitle = TextEditingController();
    TextEditingController controlerSubtitle = TextEditingController();

    Map<String,dynamic> conteudoAdd = Map();
    String dia = DateTime.now().day.toString();
    String mes = DateTime.now().month.toString();
    String ano = DateTime.now().year.toString();

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Adcionar Anotação!'),
            content: Column(mainAxisSize: MainAxisSize.min ,children: [

              TextField(
                decoration: InputDecoration(labelText: 'Título'),
                controller: controlerTitle,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Conteúdo'),
                controller: controlerSubtitle,
              ),
            ],),
            actions: [
              TextButton(
                child: Text('Cancelar'),
                onPressed: (){Navigator.pop(context);},
              ),
              TextButton(
                child: Text('Salvar'),
                onPressed: (){
                  conteudoAdd['title'] = controlerTitle.text;
                  conteudoAdd['subtitle'] = controlerSubtitle.text;
                  conteudoAdd['date'] = '$dia/$mes/$ano';

                  setState(() {
                    _listNote.add(conteudoAdd);
                  });
                  _dataBaseNotes.inserir(conteudoAdd);
                  Navigator.pop(context);
                }
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
        title: Text('Anotações'),
        backgroundColor: Colors.blue[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
        onPressed: () => _onPressedButtonFloat(),

      ),
      body: FutureBuilder<List>(
        future: _listNoteInit(),
        builder: (context, snapshot) => _builderFuture(context, snapshot),
      )
    );
  }
}
