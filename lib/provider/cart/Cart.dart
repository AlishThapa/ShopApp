import 'package:daraz_pro_max/provider/cart/cart_item.dart';
import 'package:flutter/material.dart';

class cart with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }

  void addItem(String productId, double productPrice, String productTitle) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                title: existingCartItem.title,
                id: existingCartItem.id,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ),);
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: productTitle,
          price: productPrice,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
