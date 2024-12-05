import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/cart_cubit.dart';
import '../../../models/cart_item.dart';
import '../../../models/product.dart';
import '../../custom_snackbar.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter, // Align button to the bottom
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 8.0), // Padding from the bottom
          child: ElevatedButton.icon(
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addToCart(
                CartItem(
                  productId: product.id,
                  title: product.title,
                  price: product.price,
                ),
              );
              CustomSnackbar.showCustomSnackbar(
                context: context,
                title: 'Successfully Added!',
                message: '${product.title} added to cart!',
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              minimumSize: const Size(140, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
            ),
            icon: const Icon(Icons.add_shopping_cart, size: 20),
            label: const Text(
              'Add to Cart',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
