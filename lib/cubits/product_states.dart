// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../models/product.dart';

class ProductState {}

class InitalState extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  List<Product> products;
  ProductSuccess({
    required this.products,
  });
}

class ProductFailure extends ProductState {}

class NoProductsState extends ProductState {}
