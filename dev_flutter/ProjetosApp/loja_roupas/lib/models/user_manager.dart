import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_roupas/helpers/firebase_errors.dart';

import 'User.dart';

class UserManager extends ChangeNotifier{

  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  UserA? user;
  bool get isLoggedIn => user?.name != null;

  bool _loading = false;
  bool get loading => _loading;
  set loading(value){
    _loading = value;
    notifyListeners();
  }

  //Efetuando Login do Usuario
  Future<void> signIn(UserA user, Function onFail, Function onSuccess)async{
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      await _loadCurrentUser(userAuth: result.user);

      onSuccess();
    } catch(error){
      int indexStart = error.toString().indexOf('[');
      int indexEnd = error.toString().indexOf(']');
      onFail(getErrorString(error.toString().substring(indexStart+1,indexEnd)));
    }
    loading = false;
  }

  //Cadastrando o Usuario
  Future<void> signUp({UserA? user, Function? onFail, Function? onSuccess})async{
    loading = true;
    try{
      final UserCredential result = await auth.createUserWithEmailAndPassword(email: user!.email!, password: user.password!);
      user.id = result.user!.uid;

      await user.saveData();
      this.user = user;

      onSuccess!();
    }catch(error){
      int indexStart = error.toString().indexOf('[');
      int indexEnd = error.toString().indexOf(']');
      onFail!(getErrorString(error.toString().substring(indexStart+1,indexEnd)));
    }
    loading = false;
  }

  //Recuperando dados do firebase
  Future<void> _loadCurrentUser({User? userAuth}) async{
    User? current = userAuth ?? auth.currentUser;
    if(current != null){
      final DocumentSnapshot docUser = await FirebaseFirestore.instance.collection('users').doc(current.uid).get();
      user = UserA.fromDocument(docUser);
      notifyListeners();
    }
  }

  //Saindo da conta
  void signOut() {
    auth.signOut();
    user = null;
  }
}