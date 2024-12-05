import 'package:flutter/material.dart';

import '../../models/product.dart';

class BuildProductDescription extends StatelessWidget {
  const BuildProductDescription({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      product.description,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
