import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_roupas/common/custom_drawer/custom_drawer.dart';
import 'package:loja_roupas/models/product_manager.dart';
import 'package:loja_roupas/screens/products/components/product_list_tile.dart';
import 'package:provider/provider.dart';

import 'components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),

      appBar: AppBar(
        title: Consumer<ProductManager>(
          builder: (_,productManager,__){
            if(productManager.search.isEmpty){
              return Text('Produtos');
            } else{
              return LayoutBuilder(
                builder: (_, constrains){
                  return GestureDetector(
                    child: Container(
                      width: constrains.biggest.width,
                      child: Text(productManager.search, textAlign: TextAlign.center,)
                    ),
                    onTap: () async{
                      final search = await showDialog(context: context, builder: (_) => SearchDialog(initialText: productManager.search));
                      if(search != null){
                        productManager.search = search;
                      }
                    },
                  );
                },
              );
            }
          }
        ),
        centerTitle: true,
        actions: [
          Consumer<ProductManager>(
            builder: (_, productManager, __){
              if(productManager.search.isEmpty){
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async{
                    final search = await showDialog(context: context, builder: (_) => SearchDialog());
                    if(search != null){
                      productManager.search = search;
                    }
                  },
                );
              } else{
                return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async{
                    productManager.search = '';
                  }
                );
              }
            },
          ),
        ],
      ),

      body: Consumer<ProductManager>(
        builder: (_, productManager, __){
          final filterProducts = productManager.filteredProduct;
          return ListView.builder(
            padding: EdgeInsets.all(4),
            itemCount: filterProducts.length,
            itemBuilder: (_, index){
              return ProductListTile(filterProducts[index]);
            }
          );
        }
      ),
    );
  }
}
