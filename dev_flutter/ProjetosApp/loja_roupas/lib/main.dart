import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loja_roupas/models/product_manager.dart';
import 'package:loja_roupas/screens/base/BaseScreen.dart';
import 'package:loja_roupas/screens/login/login_screen.dart';
import 'package:loja_roupas/screens/product/product_screen.dart';
import 'package:loja_roupas/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:loja_roupas/models/Product.dart';

import 'models/user_manager.dart';


void main() async{
  //Inicializando Banco de Dados
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserManager(), lazy: true),
      ChangeNotifierProvider(create: (_) => ProductManager(), lazy: false,)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monamour',
      home: BaseScreen(),
      onGenerateRoute: (settings){
        switch(settings.name){
          case '/product':
            return MaterialPageRoute(
                builder: (_) => ProductScreen(settings.arguments as Product)
            );
          case '/login':
            return MaterialPageRoute(
                builder: (_) => LoginScreen()
            );
          case '/signup':
            return MaterialPageRoute(
                builder: (_) => SignUpScreen()
            );
          default:
            return MaterialPageRoute(
                builder: (_)=>BaseScreen()
            );
        }
      },
      theme: ThemeData(
        primaryColor: Colors.pink.shade900,
        scaffoldBackgroundColor: Colors.pink.shade900,
        appBarTheme: AppBarTheme(elevation: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  ));
}


