import 'package:daraz_pro_max/provider/providerProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';

  // final String title;
  //
  // const ProductDetail(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final productId= ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<products>(context , listen: false).findById(productId);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
      ),
    );
  }
}
