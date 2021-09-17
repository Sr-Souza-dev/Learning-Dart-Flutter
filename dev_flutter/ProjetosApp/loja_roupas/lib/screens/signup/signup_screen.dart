import 'package:flutter/material.dart';
import 'package:loja_roupas/helpers/validators.dart';
import 'package:loja_roupas/models/User.dart';
import 'package:loja_roupas/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final UserA user = UserA();
  final TextEditingController _passConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Consumer<UserManager>(
              builder: (_,userManager,__){
                return ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nome', hintText: 'Nome Completo'),
                      enabled: !userManager.loading,
                      validator: (nome){
                        if(nome!.isEmpty){
                          return 'Campo obrigatório';
                        }else if (nome.trim().split(' ').length <= 1){
                          return 'Preencha seu nome completo';
                        }
                        return null;
                      },
                      onSaved: (nome) => user.name = nome,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'E-mail', hintText: 'Digite seu e-mail'),
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      validator: (email){
                        if(email!.isEmpty){
                          return 'Campo obrigatório!';
                        }else if(!emailValid(email)){
                          return'E-mail inválido';
                        }
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Senha', hintText: 'Digite sua senha'),
                      enabled: !userManager.loading,
                      obscureText: true,
                      controller: _passConfirm,
                      validator: (pass){
                        if(pass!.isEmpty){
                          return 'Campo Obrigatorio';
                        }else if (pass.length < 6){
                          return 'Senha muito Curta';
                        }
                        return null;
                      },
                      onSaved: (pass) => user.password = pass,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Repita a senha', hintText: 'Digite novamente sua senha'),
                      enabled: !userManager.loading,
                      obscureText: true,
                      validator: (pass){
                        if(pass!.isEmpty){
                          return 'Campo Obrigatorio';
                        }else if (pass.length < 6){
                          return 'Senha muito Curta';
                        }else if(_passConfirm.text != pass){
                          return 'Senhas não coincidem!';
                        }
                        return null;
                      },
                      onSaved: (pass) => user.confirmPassword = pass,
                    ),

                    SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        child: userManager.loading
                            ? CircularProgressIndicator(color: Colors.white,)
                            :Text('Criar Conta', style: TextStyle(fontSize: 18),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                        ),
                        onPressed: userManager.loading
                            ? null
                            :(){
                                if(_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                  userManager.signUp(
                                      user: user,
                                      onFail: (erro){
                                        SnackBar(
                                          content: Text('Falha ao Cadastrar: $erro'),
                                          backgroundColor: Colors.red,
                                        );
                                      },
                                      onSuccess: (){
                                        Navigator.of(context).pop();
                                      }
                                  );
                                }
                              },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
