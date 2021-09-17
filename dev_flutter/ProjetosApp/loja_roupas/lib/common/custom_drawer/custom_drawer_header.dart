import 'package:flutter/material.dart';
import 'package:loja_roupas/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 200,
      child: Consumer<UserManager>(
        builder:(_,userManager, __){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Monamour\nStore For You',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12,),
              Text(
                  'Olá, ${userManager.user?.name ?? ''}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                  child: Text(
                    userManager.isLoggedIn ? 'Sair' : 'Entre ou cadastre-se',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                onTap: (){
                    if(userManager.isLoggedIn){
                      userManager.signOut();
                    }else{
                      Navigator.of(context).pushNamed('/login');
                    }
                },
              )

            ],
          );
        }
      ),
    );
  }
}
