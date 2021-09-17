import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  //Salvando/Atualizando dados no database referenciando o nome do documento (também serve para atualizar dados)
  FirebaseFirestore.instance
      .collection('usuarios')
      .doc('pontuacao')
      .set({"Gabriel": "900", "Ana": "800"});

  //atualizando dados
  FirebaseFirestore.instance
      .collection('usuarios')
      .doc('pontuacao')
      .update({'Gabriel': '5000'});

  //Salvando dados no database com nome do documento automatico e retorna o nome para a variavel 'ref'
  DocumentReference ref = await FirebaseFirestore.instance
      .collection('usuarios')
      .add({"nome": "Gabriel Rosa", "senha": "asfsa48465"});
  //Printando o nome do documento que acabou de ser salvo
  print('Iten Salvo ${ref.id}');

  //Removendo um item do database
  FirebaseFirestore.instance.collection('usuarios').doc('003').delete();

  //Recuperando dados de um document (um unico document) do firebase
  DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('usuarios').doc('001').get();
  print('Dados Recuperados: ${snapshot.data().toString()}');

  //Recupera todos documento
  QuerySnapshot snapshorQuery =
      await FirebaseFirestore.instance.collection('usuarios').get();
  for (DocumentSnapshot item in snapshorQuery.docs) {
    print('Item: ${item.data().toString()}');
  }

  //Recupera todos documentos que forem atualizados (Fica ouvindo e quando há uma alteração nos dados ele retorna toda lista de dados atualizada)
  FirebaseFirestore.instance
      .collection('usuarios')
      .snapshots()
      .listen((snapshot) {
    for (DocumentSnapshot item in snapshot.docs) {
      print('Item: ${item.data().toString()}');
    }
  });

  //Aplicando Filtros Basicos
  /*
    Tipos de filtros que podem ser utilizados junto com where
    .where('nome', isEqualTo: "Gabriel") -> filtra nomes iguais a Gabriel
    .where('idade', isLessThan: 20) -> filtra os docs com idade menor que 20
    .where('idade', isGreaterThan: 19) -> filtra os docs com idade maior que 19
    .where('idade', isGreaterThanOrEqualTo: 19) -> filtra os docs com idade maior ou igual que 19
    .where('idade', isLessThanOrEqualTo: 19) -> filtra os docs com idade menor ou igual que 19
    OBS: é possivel colocar o tanto de where que quiser where(...).where(...)...
    .orderBy('idade', descending: true) -> ordena do maior para o menor
    .orderBy('idade', descending: false) -> ordena do menor para o maior
    .limit(2) -> Limita a quantidade de resultados a somente 2 itens
   */
  QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
      .collection('usuarios')
      .where('idade', isGreaterThanOrEqualTo: 19)
      .orderBy('idade', descending: false)
      .limit(2)
      .get();
  for (DocumentSnapshot item in querySnapshot2.docs) {
    dynamic dados = item.data();
    print('Nome: ${dados['nome']}, idade: ${dados['idade'].toString()}');
  }

  //Pesquisando textos no firebase (utilizado nas barras de navegação)
  String pesquisa = 'Gab';
  QuerySnapshot querySnapshot3 = await FirebaseFirestore.instance
      .collection('usuarios')
      .where("nome", isGreaterThanOrEqualTo: pesquisa)
      .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
      .get();

  for (DocumentSnapshot item in querySnapshot3.docs) {
    dynamic dados = item.data();
    print('Nome: ${dados['nome']}, idade: ${dados['idade'].toString()}');
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Migs Fofurinha'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Text(
            'Amo você peste',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
