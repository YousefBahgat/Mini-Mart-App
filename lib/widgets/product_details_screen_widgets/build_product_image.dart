import 'package:flutter/material.dart';

import '../../models/product.dart';

class BuildProductImage extends StatelessWidget {
  const BuildProductImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          product.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 250,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.error, size: 50, color: Colors.red),
            );
          },
        ),
      ),
    );
  }
}
