import 'package:flutter/material.dart';

import '../../models/product.dart';

class BuildProductTitle extends StatelessWidget {
  const BuildProductTitle({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
