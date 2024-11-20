import 'package:ecommerce/models/product.dart';

class Shop {
  final List<Product> _shop = [
    Product(
        name: "product1",
        price: 99.99,
        description: "item_description",
        //imagePath: imagePath
    ),Product(
        name: "product1",
        price: 99.99,
        description: "item_description",
        //imagePath: imagePath
    ),
    Product(
        name: "product2",
        price: 90.99,
        description: "item_description",
        //imagePath: imagePath
    ),
    Product(
        name: "product3",
        price: 95.99,
        description: "item_description",
        //imagePath: imagePath
    ),
    Product(
        name: "product4",
        price: 93.99,
        description: "item_description",
        //imagePath: imagePath
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}