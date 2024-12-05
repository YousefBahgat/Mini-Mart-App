import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit.dart';
import '../cubits/product_cubit.dart';
import '../cubits/product_states.dart';
import '../models/cart_item.dart';
import '../screens/cart_screen.dart';
import '../widgets/product_list_screen_widgets/cutom_error_widget.dart';
import '../widgets/product_list_screen_widgets/display_products.dart';
import '../widgets/product_list_screen_widgets/icon_badge.dart';
import '../widgets/product_list_screen_widgets/no_products_widget.dart';
import '../widgets/product_list_screen_widgets/products_loading_widget.dart';
import '../widgets/product_list_screen_widgets/search_bar_tool.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          BlocBuilder<CartCubit, List<CartItem>>(
            builder: (context, cartItems) {
              int totalQuantity =
                  BlocProvider.of<CartCubit>(context).getTotalQuantity();
              return badges.Badge(
                child: IconButton(
                  icon: IconBadge(totalQuantity: totalQuantity),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: SearchBarTool()),
              if (state is ProductLoading)
                const LoadingWidget()
              else if (state is ProductSuccess)
                DisplayProducts(products: state.products)
              else if (state is NoProductsState)
                const NoProductsWidget()
              else if (state is ProductFailure)
                const CustomErrorWidget()
            ],
          );
        },
      ),
    );
  }
}
