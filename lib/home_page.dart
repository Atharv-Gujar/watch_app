import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchapp/product_list.dart';
import 'package:watchapp/cart_page.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;


  List<Widget> pages = const  [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar:
      BottomNavigationBar(
        iconSize: 35,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
         BottomNavigationBarItem(
            icon: Icon(Icons.home),
           label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          )
        ],
      ),
    );
  }
}
