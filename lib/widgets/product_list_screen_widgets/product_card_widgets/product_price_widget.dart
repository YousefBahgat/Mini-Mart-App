import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${product.price.toStringAsFixed(2)}',
      style: const TextStyle(
        color: Colors.green, // Retaining green for price
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
