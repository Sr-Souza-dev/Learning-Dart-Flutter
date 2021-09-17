import 'package:loja_roupas/models/User.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:loja_roupas/helpers/validators.dart';
import 'package:loja_roupas/models/user_manager.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(
              child: Text(
                  'CRIAR CONTA',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            onPressed: (){
                Navigator.of(context).pushReplacementNamed('/signup');
            },
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __){
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'E-mail', labelText: 'E-mail'),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: !userManager.loading,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email.toString())){
                          return 'E-mail inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Senha', labelText: 'Senha'),
                      controller: _passController,
                      obscureText: true,
                      autocorrect: false,
                      enabled: !userManager.loading,
                      validator: (pass){
                        if(pass!.isEmpty || pass.length < 6){
                          return 'Senha inválida';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text('Esqueci minha senha'),
                        onPressed: (){},
                      ),
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        child: userManager.loading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                        ),
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState!.validate()){
                            userManager.signIn(
                                UserA(email: _emailController.text,password: _passController.text),
                                (erro){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Falha ao entrar: $erro'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                (){
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
