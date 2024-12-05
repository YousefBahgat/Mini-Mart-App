import 'package:flutter/material.dart';

import '../../models/product.dart';

class BuildProductPrice extends StatelessWidget {
  const BuildProductPrice({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${product.price.toStringAsFixed(2)}',
      style: const TextStyle(
        fontSize: 22,
        color: Colors.green,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
