import 'package:flutter/material.dart';
import 'package:infoware/helper/api_service.dart';
import 'package:infoware/models/product_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: FutureBuilder<ProductDetails>(
        future: ApiService.fetchProductDetails(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to fetch product details'),
            );
          } else {
            final productDetails = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      width: 200,
                      child: Image.network(productDetails.image),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Product ID:  ${productDetails.id}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Title:  ${productDetails.tital}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Description:  ${productDetails.description}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price:  \$${productDetails.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Category:  ${productDetails.category}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ]),
            );
          }
        },
      ),
    );
  }
}
