import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Post.dart';

class HomePost extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePost> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  //CRIANDO UMA FUTURE PARA RETORNAR DADOS DA API (GET)
  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse(_urlBase + '/posts'));
    List<Post> _lista = [];
    if (response.statusCode != 200) return _lista;
    var dadosJason = json.decode(response.body);
    for (var post in dadosJason) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      _lista.add(p);
    }
    return _lista;
  }

  //INSERINDO DADOS NA API (POST)
  void _post() async{
    http.Response response = await http.post(
      Uri.parse(_urlBase + '/posts'),
      headers: {'Content-type': 'application/json; charset=UTF-8',},
      body: json.encode({
        "title": 'New Post',
        "body": 'new post body',
        "userId": 120,
      }),
    );
    print(response.statusCode);
    print(response.body);
  }

  //ATUALIZANDO DADOS NA API (Atualiza todos os dados) (POST)
  _put() async{
    http.Response response = await http.put(
      Uri.parse(_urlBase + '/posts/1'),
      headers: {'Content-type': 'application/json; charset=UTF-8',},
      body: json.encode({
        "title": 'Alterado',
        "body": 'Alterada',
        "userId": 1,
      }),
    );

    print(response.statusCode);
    print(response.body);
  }

  //ATUALIZANDO DADOS NA API (Atualiza somente dados selecionados) (PATCH)
  _patch()async{
    http.Response response = await http.patch(
      Uri.parse(_urlBase + '/posts/1'),
      headers: {'Content-type': 'application/json; charset=UTF-8',},
      body: json.encode({
        "body": 'Alterada',
      }),
    );

    print(response.statusCode);
    print(response.body);
  }

  //DELETANDO DADOS API
  _delete()async{
    http.Response response = await http.delete(Uri.parse(_urlBase + '/posts/1'));
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
        backgroundColor: Colors.blueAccent,
      ),
      //************** CONSTRUINDO UMA FUTURE *****************
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                  children: [
                  ElevatedButton(
                      child: Text('Salvar'),
                      onPressed: () => _post(),
                  ),
                  ElevatedButton(
                    child: Text('Atualizar'),
                    onPressed: () => _patch(),
                  ),
                  ElevatedButton(
                    child: Text('Remover'),
                    onPressed: () => _delete(),
                  )
              ],),
              Expanded(
                child: FutureBuilder<List<Post>>(
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

                                List<Post>? lista = snapshot.data;
                                Post? post = lista?[index];

                                return ListTile(
                                  title: Text('${post?.title}'),
                                  subtitle: Text('${post?.id.toString()}'),
                                  //Definindo um alerta ao clicar na tela
                                );},
                            ),
                          );
                        }//Fim else
                        break;
                    }//Fim Switch
                    return(Center(child: Text('Erro ao abrir aplicativo')));
                  },),
              ),
            ],
          )
      ),
    );
  } //Fim build
}
