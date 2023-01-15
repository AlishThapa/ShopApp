import 'package:daraz_pro_max/Screens/ProductDetail/ProductDetail.dart';
import 'package:daraz_pro_max/provider/cart/Cart.dart';
import 'package:daraz_pro_max/provider/providerProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;
  //
  // const ProductItem(this.id, this.title, this.imageURL, {super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final Cart = Provider.of<cart>(context,listen: false);
    return
        //ClipRRect forces the GridTile to take a rect shape
        ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black38,
          leading: Consumer<Product>(
            builder: (ctx, products, child)=> IconButton(
              color: Colors.teal,
                icon: Icon(product.isFavourite? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavourite();
              },
            ),
          ),
          title: Text(product.title),
          trailing: IconButton(
            color: Colors.teal,
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Cart.addItem(product.id, product.price, product.title);
          },
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetail.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
