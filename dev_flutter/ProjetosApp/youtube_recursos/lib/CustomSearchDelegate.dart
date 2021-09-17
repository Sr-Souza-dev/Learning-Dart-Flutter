import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '' ;
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, '');
        },
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then(
        (onValue){
          close(context, query);
        }
    );
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('Digitando $query');
    List<String> lista = [];
    if(query.isNotEmpty){
      lista = ['Goku', 'Androind','Carros'].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();
    }
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(lista[index]),
          onTap: (){
            query = lista[index];
          },
        );
      },
    );
  }

}