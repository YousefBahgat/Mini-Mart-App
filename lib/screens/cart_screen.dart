import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_app/widgets/cart_screen_widgets/custom_empty_cart.dart';
import '../cubits/cart_cubit.dart';
import '../models/cart_item.dart';
import '../widgets/cart_screen_widgets/build_total_price_section.dart';
import '../widgets/custom_snackbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartCubit, List<CartItem>>(
        builder: (context, cartItems) {
          return cartItems.isEmpty
              ? const CustomEmptyCart()
              : _buildCartContent(context, cartItems);
        },
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, List<CartItem> cartItems) {
    final double totalPrice = _calculateTotalPrice(cartItems);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _buildCartItem(context, item);
            },
          ),
        ),
        BuildTotalPriceSection(totalPrice: totalPrice),
      ],
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(item.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('\$${item.price.toStringAsFixed(2)} per item'),
        trailing: _buildQuantityControl(context, item),
      ),
    );
  }

  Widget _buildQuantityControl(BuildContext context, CartItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            if (item.quantity > 1) {
              BlocProvider.of<CartCubit>(context)
                  .removeFromCart(item.productId);
            } else {
              // Remove the item completely if quantity is 1
              _showRemoveItemSnackbar(context, item);
              BlocProvider.of<CartCubit>(context)
                  .removeFromCart(item.productId);
            }
          },
        ),
        Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () {
            BlocProvider.of<CartCubit>(context).addToCart(item);
          },
        ),
      ],
    );
  }

  void _showRemoveItemSnackbar(BuildContext context, CartItem item) {
    CustomSnackbar.showCustomSnackbar(
      context: context,
      title: 'Product removed successfully!',
      message: '${item.title} has been removed from the cart.',
    );
  }

  double _calculateTotalPrice(List<CartItem> cartItems) {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
