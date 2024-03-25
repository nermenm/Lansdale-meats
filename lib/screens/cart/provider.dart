import 'package:flutter/material.dart';

import 'cart_class.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    bool alreadyInCart = _cartItems.any((cartItem) =>
    cartItem.name == item.name &&
        // cartItem.product_id == item.product_id &&
        cartItem.price == item.price &&
        cartItem.imageSrc == item.imageSrc);

    // If the item is not in the cart, add it
    if (!alreadyInCart) {
      _cartItems.add(item);
      notifyListeners();
    }

  }
  // void deleteFromCart(CartItem item) {
  //   _cartItems.removeWhere((cartItem) =>
  //   cartItem.name == item.name &&
  //       cartItem.price == item.price &&
  //       cartItem.imageSrc == item.imageSrc);
  //   notifyListeners();
  // }
  void deleteFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}


