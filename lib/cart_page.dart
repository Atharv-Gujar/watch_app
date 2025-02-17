import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watchapp/cart_provider.dart';

import 'global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return  AlertDialog(
                          title: const Text(
                            'Delete Product',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                          ),
                          content:const  Text(
                              'Are you sure you want to remove the product from the cart ?',style: TextStyle(fontWeight: FontWeight.bold),),
                          actions: [
                            TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: const Text('No',style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
                            ),
                            TextButton(
                              onPressed: (){
                                Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Yes',style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                cartItem['title'].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                cartItem['color'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          }),
    );
  }
}
