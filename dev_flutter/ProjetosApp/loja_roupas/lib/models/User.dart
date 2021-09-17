import 'package:cloud_firestore/cloud_firestore.dart';

class UserA{
  String? email;
  String? password;
  String? name;
  String? confirmPassword;
  String? id;

  //Construtor Padrão
  UserA({this.email, this.password, this.name, this.id});

  //Construtor do Documento (para recuperar os dados)
  UserA.fromDocument(DocumentSnapshot document){
    Map data = document.data() as Map;
    name = data['name'] as String;
    email = data['email'] as String;
    id = document.id;
  }

  //Salvando informações no DataBase
  Future<void> saveData() async{
    await FirebaseFirestore.instance.collection('users').doc(id).set(toMap());
  }
  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email
    };
  }
}