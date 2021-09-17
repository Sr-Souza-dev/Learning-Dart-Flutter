import 'package:flutter/material.dart';
import 'package:youtube_recursos/CustomSearchDelegate.dart';
import 'package:youtube_recursos/telas/biblioteca.dart';
import 'package:youtube_recursos/telas/emAlta.dart';
import 'package:youtube_recursos/telas/inicio.dart';
import 'package:youtube_recursos/telas/inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indexAtual = 0;
  dynamic _resultado = '';

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
            "img/youtube.png",
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 0.8,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async{
              var result = await showSearch(context: context, delegate: CustomSearchDelegate());

              setState(() {
                _resultado = result;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: telas[_indexAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // No shifting a cor definida no bottomNavigationBarItem será a cor da barra toda
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: _indexAtual,
        onTap: (index){
          setState(() {
            _indexAtual = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              label: "Em alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              label: "Biblioteca",
              icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}
