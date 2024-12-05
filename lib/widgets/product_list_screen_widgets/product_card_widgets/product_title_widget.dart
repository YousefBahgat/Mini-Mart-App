import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Colors.black87, // Slightly muted black for readability
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
