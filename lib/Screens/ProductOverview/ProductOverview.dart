
import 'package:flutter/material.dart';
import '../../Widgets/products_grid.dart';


enum FilterOption {
  Favourites,
  All,
}

class ProductOverview extends StatefulWidget {
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
            onSelected: (FilterOption selectedValues){
             setState(() {
               if(selectedValues == FilterOption.Favourites){
                 _showOnlyFavourites = true;
               }
               else if (selectedValues == FilterOption.All) {
                 _showOnlyFavourites = false;
               }
             });

            },
              icon: Icon(Icons.more_vert),
          //itemBuilder builds the entries for popupMenuButton
              itemBuilder: (_) =>[
                PopupMenuItem(child:  Text('Only Favourites'), value:FilterOption.Favourites),
                PopupMenuItem(child:  Text('Show All'), value:FilterOption.All ),
              ]
          )
        ],
      ),
      body: products_grid(_showOnlyFavourites),
    );
  }
}

