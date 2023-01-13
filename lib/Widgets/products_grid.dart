import 'package:daraz_pro_max/Widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider/providerProduct.dart';


class products_grid extends StatelessWidget {

  final bool showOnlyFavourites;
  products_grid(this.showOnlyFavourites);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<products>(context);
    //listening to every products
    final Products = showOnlyFavourites ? productData.favouriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: Products.length,
      //gridDelegate is to show how the grid should be displayed
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: Products[i],
        child: ProductItem(
          // Products[i].id,
          // Products[i].title,
          //Products[i].imageURL,
        ),
      ),
    );
  }
}
