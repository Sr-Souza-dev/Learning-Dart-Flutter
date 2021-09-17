import 'package:flutter/material.dart';
import 'package:loja_roupas/common/custom_drawer/custom_drawer_header.dart';
import 'package:loja_roupas/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink.shade100,
                  Colors.white
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter

              ),
            ),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              Divider(),
              DrawerTile(Icons.home, 'Início',0),
              DrawerTile(Icons.list, 'Produtos',1),
              DrawerTile(Icons.playlist_add_check, 'Meus Pedidos',2),
              DrawerTile(Icons.location_on, 'Lojas',3),
            ],
          ),
        ],
      ),
    );
  }
}

