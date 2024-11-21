import 'package:ecommerce/models/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';


class Shop extends ChangeNotifier{
  final List<Product> _shop = [
    Product(
        name: "Sony Headphone",
        price: 1999,
        description: "Headphones Sony WX100",
        imagePath: 'assets/headphones.jpg'
    ),Product(
        name: "Tshirt",
        price: 199.99,
        description: "Yellow Tshirt-Zara",
        imagePath: 'assets/shirt.jpg'
    ),
    Product(
        name: "Puma",
        price: 1990.99,
        description: "Puma running black shoes",
        imagePath: 'assets/shoes.jpg'
    ),
    Product(
        name: "Titan Analog",
        price: 1295.99,
        description: "Titan analog black watch",
        imagePath: 'assets/watch.jpg'

    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}