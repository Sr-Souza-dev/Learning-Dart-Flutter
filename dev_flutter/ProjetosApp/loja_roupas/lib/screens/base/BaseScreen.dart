import 'package:flutter/material.dart';
import 'package:loja_roupas/common/custom_drawer/custom_drawer.dart';
import 'package:loja_roupas/models/page_manager.dart';
import 'package:loja_roupas/screens/login/login_screen.dart';
import 'package:loja_roupas/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController(initialPage: 0);
  
  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Home'),
            ),
          ),
          ProductsScreen(),
        ],
      ),
    );
  }
}
