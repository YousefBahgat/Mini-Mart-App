import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'product_card.dart';

class DisplayProducts extends StatelessWidget {
  final List<Product> products;

  const DisplayProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Dynamically calculate the number of columns based on orientation and screen width
    final crossAxisCount = isPortrait
        ? (screenWidth / 180)
            .floor() // 180 is a card width estimate for portrait
        : (screenWidth / 200).floor(); // 200 for landscape for more spacing

    final childAspectRatio = isPortrait
        ? 0.5 // Proportion for portrait (slightly taller cards)
        : screenHeight /
            (screenWidth * 0.75); // Proportion for landscape (wider cards)

    return SliverPadding(
      padding: const EdgeInsets.all(8.0), // Consistent spacing around the grid
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Dynamic columns
          childAspectRatio:
              childAspectRatio, // Adjust card proportions dynamically
          crossAxisSpacing: 16, // Adequate spacing between columns
          mainAxisSpacing: 16, // Adequate spacing between rows
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductCard(product: products[index]);
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
