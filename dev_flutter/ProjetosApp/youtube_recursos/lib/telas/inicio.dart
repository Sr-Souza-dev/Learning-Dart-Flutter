import 'package:flutter/material.dart';
import 'package:youtube_recursos/model/Video.dart';

import '../ApiYouTub.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  void initState(){
    super.initState();
    //Quando o widget é aberto e adciona itens inicias uma unica vez
    print('Chamado 1 - initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Quando os dados são carregados ao iniciar o widget
    print('Chamado 2 - didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    //quando o widget é atualizado
    print('Chamado 2 - didUpdateWidget');
  }

  @override
  void dispose() {
    super.dispose();
    //Quando o widget é encerrado
    print('Chamado 4 - dispose');

  }

  @override
  Widget build(BuildContext context) {
    print('Chamado 3 - build');
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot){

        switch (snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];
                    print(video.imagem);
                    return GestureDetector(
                      onTap: () {

                      },
                      child: Column(
                          children:[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.imagem)
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal),
                            )
                          ]
                      ),
                    );
                  },
                  separatorBuilder: (context,index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),

              );
            }else{
              return Center(
                child: Text('Nenhum dado a ser exibido'),
              );
            }
            break;

        }
      },
    );
  }
}
