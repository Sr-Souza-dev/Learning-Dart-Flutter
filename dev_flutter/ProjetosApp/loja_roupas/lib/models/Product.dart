import 'package:cloud_firestore/cloud_firestore.dart';


import 'item_size.dart';

class Product{

  //Construtor
  Product.fromDocument(DocumentSnapshot document){
    Map doc = document.data() as Map;
    name = doc['name'] as String;
    description = doc['description'] as String;
    images = List<String>.from(doc['images'] as List<dynamic>);
    id = document.id;
    sizes = (doc['sizes'] as List<dynamic>).map((size)=> ItemSize.fromMap(size)).toList as List<ItemSize>?;
  }

  //Variaveis
  String? name;
  String? id;
  String? description;
  List<String>? images;
  List<ItemSize>? sizes;
}