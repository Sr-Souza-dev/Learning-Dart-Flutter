import 'package:flutter/material.dart';
import 'package:loja_roupas/models/Product.dart';

class ProductListTile extends StatelessWidget {

  ProductListTile(this.product);
  late final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Container(
          height: 100,
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              AspectRatio(
                  aspectRatio: 1,
                child: Image.network(product.images!.first),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.name.toString(),
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'A partir de',
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      ),
                    ),
                    Text(
                      'R\$ 23,98',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
