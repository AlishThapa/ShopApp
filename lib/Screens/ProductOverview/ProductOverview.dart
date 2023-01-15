import 'package:daraz_pro_max/provider/cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Widgets/products_grid.dart';
import '../../Widgets/badge.dart';

enum FilterOption {
  favourites,
  all,
}

class ProductOverview extends StatefulWidget {
  const ProductOverview({super.key});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var _showOnlyFavourites = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daraz'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOption selectedValues) {
                setState(() {
                  if (selectedValues == FilterOption.favourites) {
                    _showOnlyFavourites = true;
                  } else if (selectedValues == FilterOption.all) {
                    _showOnlyFavourites = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              //itemBuilder builds the entries for popupMenuButton
              itemBuilder: (_) =>
              [
                const PopupMenuItem(
                    value: FilterOption.favourites,
                    child: Text('Only Favourites')),
                const PopupMenuItem(
                    value: FilterOption.all,
                    child: Text('Show All')),
              ]),
          Consumer<cart>(
            builder: (_, cartData, ch) =>
                Badge(
                  value: cartData.itemCount.toString(),
                  color: Colors.black38,
                  child: ch!,
                ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: products_grid(_showOnlyFavourites),
    );
  }
}
