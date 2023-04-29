import 'package:flutter/material.dart';
import 'package:newapp/components/produitspage/product_info_card.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductInfo productInfo;

  const ProductDetailsScreen({Key? key, required ProductInfo product, required this.productInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productInfo.title as String),
      ),
      body: Column(
        children: [
          Image.network(productInfo.image as String),
          const SizedBox(height: 16.0),
          Text(productInfo.title as String, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8.0),
          Text(
            productInfo.count as String,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8.0),
          Text('\$${productInfo.price}',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle add to cart button click
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
