import 'package:ecommerce/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import '../models/product.dart'; // Import your Product model

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Function to show the confirmation dialog for removing an item
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white, // Background color of the dialog
        title: Text(
          'Remove this item from your cart?',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          'Are you sure you want to remove this product from your cart?',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              iconColor: Colors.black,
              // Button background color
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<Shop>().removeFromCart(product); // Remove product from cart
              Navigator.pop(context); // Close the dialog after removal
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              iconColor: Colors.black,
              // Button background color
            ),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text('Payment Successful'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart; // Watch cart updates

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty ?
              Center(child: Text('Your cart is empty.')) :
              ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item), // Remove item on press
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(58.0),
            child: Mybutton(
                onTap: () => payButtonPressed(context),
                child: Text('PAY NOW'),
            ),
          ),
        ],
      ),
    );
  }
}
