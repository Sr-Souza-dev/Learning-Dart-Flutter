import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  // Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Simplificando na escrita, poderiamos usar FirebaseAuth.instance em vez de auth
  FirebaseAuth auth = FirebaseAuth.instance;


  //Criando usuario
  String email = 'gabrield@gmail.com';
  String senha = '123456';
  /*
  //Cadastrando usuario
  auth.createUserWithEmailAndPassword(email: email, password: senha).then((firebaseUser){
    print('Usuario cadastrado com sucesso: ${firebaseUser.user?.email.toString()}');
  }).catchError((erro){
    print('Erro ao cadastrar: [ERRO] ${erro.toString()}');
  });


   */

  //Verificando se o usuario está logado
  User? usuarioAtual = auth.currentUser;
  if(usuarioAtual != null){
    print('Usuario Logado ${usuarioAtual.uid}');
  }else{
    print('Deslogado');
  }

  //deslogando um usuario
  await auth.signOut();

  if(usuarioAtual != null){
    print('Usuario Logado ${usuarioAtual.uid}');
  }else{
    print('Deslogado');
  }

  //logando um usuario
  await auth.signInWithEmailAndPassword(email: email, password: senha).then((firebaseUser){
    print('Usuario logado com sucesso: ${firebaseUser.user?.email.toString()}');
  }).catchError((erro){
    print('[ERRO]: ${erro.toString()}');
  });

  if(usuarioAtual != null){
    print('Usuario Logado ${usuarioAtual.uid}');
  }else{
    print('Deslogado');
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

