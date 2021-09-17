import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_roupas/models/Product.dart';


class ProductScreen extends StatelessWidget {
  final Product product;
  ProductScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name.toString()),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.longestSide,
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
              ),
              items: product.images!.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(url,fit: BoxFit.cover,)
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,

                  ),
                ),
                Padding(
                    padding:EdgeInsets.only(top: 8),
                  child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13
                      ),
                  ),
                ),
                Text(
                  'R\$ 15,29',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Text(
                  product.description.toString(),
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
