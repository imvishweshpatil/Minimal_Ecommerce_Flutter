import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  
  const MyProductTile({super.key, required this.product,});

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Add this item to your cart?',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          'Are you sure you want to add this product to the cart?',
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
            ),
          ),
          ElevatedButton(
            onPressed: () {

              context.read<Shop>().addToCart(product);
              Navigator.pop(context);
            },
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              iconColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Column(
           children: [
             AspectRatio(
               aspectRatio: 1,
               child: Container(
                 decoration: BoxDecoration(
                   color: Theme.of(context).colorScheme.secondary,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 width: double.infinity,
                 padding: EdgeInsets.all(25),
                 child: Image.asset(product.imagePath)
               ),
             ),
           ],
         ),

          SizedBox(height: 25),

          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          SizedBox(height: 10,),

          Text(
            product.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + product.price.toStringAsFixed(2),
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton.icon(
                onPressed: () => addToCart(context),
                icon: Icon(
                    Icons.add,
                    color: Colors.black
                ),
                label: Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.black
                    )
                ), // Button text
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
