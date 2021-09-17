import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  //CRIANDO UMA FUTURE PARA RETORNAR DADOS DA API
  Future<List<Post>> _recuperarPostagens() async{
    http.Response response = await http.get(Uri.parse(_urlBase+'/posts'));
    List <Post> _lista = [];
    if(response.statusCode != 200)
      return _lista;

    var dadosJason = json.decode(response.body);
    for(var post in dadosJason){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      _lista.add(p);
    }
    return _lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
        backgroundColor: Colors.blueAccent,
      ),
      //************** CONSTRUINDO UMA FUTURE *****************
      body: FutureBuilder<List<Post>>(
          future: _recuperarPostagens(),
          builder: (context, snapshot){
            switch (snapshot.connectionState){
              case(ConnectionState.none):
              case(ConnectionState.waiting):
                return CircularProgressIndicator();
                print('Conexão waiting (Aguardando)');
                break;
              case(ConnectionState.active):
              case(ConnectionState.done):
                print('Conexão done (Concluida)');
                if(snapshot.hasError){
                  print('Lista: Erro ao carregar!');
                } else{
                  print('Lista: Carregou!!');

                  //*************** CRIANDO LISTA COM OS DADOS COLETADOS ************
                  return  Container (padding: EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        print('Item ${index}');

                        List<Post>? lista = snapshot.data;
                        Post? post = lista?[index];

                        return ListTile(
                          title: Text('${post?.title}'),
                          subtitle: Text('${post?.id.toString()}'),
                          //Definindo um alerta ao clicar na tela
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text('${post?.title}'),
                                    titlePadding: EdgeInsets.all(10),
                                    titleTextStyle: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 20
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                    content: Text('${post?.body}' + ' Completa'),
                                    contentTextStyle: TextStyle(
                                        color: Colors.green,
                                        fontSize: 15
                                    ),
                                    backgroundColor: Colors.black,
                                    actions: [
                                      ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Entrar')
                                      ),
                                      ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancelar')
                                      )
                                    ],
                                  );
                                }
                            );
                          },
                          onLongPress: (){},
                        );},
                    ),
                  );
                }//Fim else
                break;
            }//Fim Switch
            return(Center(child: Text('Erro ao abrir aplicativo')));
      },),
    );
  }//Fim build
}
