import 'package:flutter/material.dart';

import '../../models/product.dart';

class BuildCategoryBadge extends StatelessWidget {
  const BuildCategoryBadge({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        product.category,
        style: const TextStyle(
          color: Colors.teal,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
