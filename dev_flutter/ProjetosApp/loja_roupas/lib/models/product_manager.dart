import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'Product.dart';

class ProductManager extends ChangeNotifier{
  //Construtor
  ProductManager(){
    _loadAllProduct();
  }

  //Variaveis
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Product>? _allProducts = [];
  String? _search = '';


  //Gets and Sets
  List<Product> get allProducts => _allProducts!;
  set allProducts(List<Product> value) {
    _allProducts = value;
  }

  String get search => _search!;
  set search(String value) {
    _search = value;
    notifyListeners();
  }

  //Busca todos os Produtos do Firebase
  Future<void> _loadAllProduct() async{
    final QuerySnapshot snapProducts = await firestore.collection('poducts').get();

    //Pegando cada documento e transformmando em um produto
    _allProducts = snapProducts.docs.map((doc) => Product.fromDocument(doc)).toList();

    notifyListeners();
  }

  //Filtrando os produtos de acordo com a Busca
  List<Product> get filteredProduct{
    final List<Product> filteredProduct = [];
    if(search.isEmpty){
      filteredProduct.addAll(allProducts);
    } else{
      filteredProduct.addAll(allProducts.where((element) => element.name!.toLowerCase().contains(search.toLowerCase())));
    }
    return filteredProduct;
  }
}