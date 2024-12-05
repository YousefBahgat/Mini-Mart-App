import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

import '../widgets/custom_snackbar.dart';
import '../widgets/product_details_screen_widgets/build_category_and_rating.dart';
import '../widgets/product_details_screen_widgets/build_product_description.dart';
import '../widgets/product_details_screen_widgets/build_product_image.dart';
import '../widgets/product_details_screen_widgets/build_product_price.dart';
import '../widgets/product_details_screen_widgets/build_product_title.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildProductImage(product: product),
                const SizedBox(height: 20),
                BuildProductTitle(product: product),
                const SizedBox(height: 10),
                BuildCategoryAndRating(product: product),
                const SizedBox(height: 10),
                BuildProductPrice(product: product),
                const SizedBox(height: 20),
                BuildProductDescription(product: product),
                const SizedBox(height: 30),
                buildAddToCartButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(product.title),
      centerTitle: true,
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton.icon(
        onPressed: () {
          handleAddToCart(context);
        },
        icon: const Icon(Icons.add_shopping_cart),
        label: const Text('Add to Cart'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  void handleAddToCart(BuildContext context) {
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
    Navigator.pop(context);
  }
}
