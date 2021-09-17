import 'package:flutter/material.dart';

class Empresa extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Empresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empresa'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('img/detalhe_empresa.png', fit: BoxFit.cover,),
                  Text(
                    'Sobre a empresa',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  )
                ],
              ),
              Text(
                'A Amazon foi criada por Jeff Bezos em 1994, quando a internet ainda não havia se popularizado. Prevendo os avanços que poderiam acontecer na rede, o executivo resolveu criar um novo modelo de negócio: vendas e distribuição online de livros. \n'
                    'Atualmente a Amazon comercializa produtos diversos, incluindo brinquedos, eletrônicos, vestuários e acessórios. Além disso, a gigante do varejo online oferece serviços, como a Amazon Web Services (serviços de armazenamento em nuvem), Amazon Prime (streaming) e Alexa (assistente virtual). \n'
                    'De acordo com a companhia, seu principal valor é conhecer as necessidades de seus consumidores. A Amazon também prega pela velocidade e inovação, fatores que contribuíram para a formação de uma cultura organizacional focada no cliente. Atualmente a Amazon está entre as empresas mais valiosas do mundo. \n'
                    'A Amazon chegou ao Brasil em 2012, quando vendia apenas livros eletrônicos. Em 2014, a empresa de Jeff Bezos expandiu seus negócios em solo brasileiro, adicionando a venda de livros físicos. Mas foi somente em 2017 que a Amazon deixou de comercializar exclusivamente livros e ampliou os negócios. Hoje é possível encontrar na Amazon Brasil produtos de inúmeras categorias. \n',
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.justify,
              ),
            ],),
        )
      ),
    );
  }
}
