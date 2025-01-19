import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const  EdgeInsets.all(20),
      child: Column(
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(
            height: 5,
          ),
          Text('\$$price',style: Theme.of(context).textTheme.bodySmall,),
          const SizedBox(
            height: 5,
          ),
          Image(
            height: 250,
            image: AssetImage(image),
          ),
        ],
      ),
    );
  }
}
