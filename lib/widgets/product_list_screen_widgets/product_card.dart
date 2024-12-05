import 'package:flutter/material.dart';

import '../../models/product.dart';

import '../../screens/product_details_screen.dart';
import 'product_card_widgets/add_to_cart_button.dart';
import 'product_card_widgets/product_image_widget.dart';
import 'product_card_widgets/product_price_widget.dart';
import 'product_card_widgets/product_title_widget.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.grey[100], // Subtle background for the card
        child: CardContent(product: product),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImageWidget(product: product),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitleWidget(product: product),
              const SizedBox(height: 4),
              ProductPrice(product: product),
            ],
          ),
        ),
        AddToCartButton(product: product),
      ],
    );
  }
}
