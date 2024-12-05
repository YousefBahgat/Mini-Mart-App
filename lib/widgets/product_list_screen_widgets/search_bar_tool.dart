import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/product_cubit.dart';

class SearchBarTool extends StatelessWidget {
  const SearchBarTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search products...',
          border: OutlineInputBorder(),
        ),
        onChanged: (query) {
          // Inform the ProductCubit to filter based on the query
          BlocProvider.of<ProductCubit>(context).filterProducts(query);
        },
      ),
    );
  }
}
