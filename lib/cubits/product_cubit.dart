import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_app/cubits/product_states.dart';
import '../services/api_service.dart';
import '../models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiService apiService;
  List<Product> _allProducts = []; // Store all fetched products
  List<Product> _filteredProducts = []; // Store filtered products

  ProductCubit(this.apiService) : super(InitalState()) {
    fetchProducts();
  }
  //get All products
  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      _allProducts = await apiService.fetchProducts();
      _filteredProducts = _allProducts; // Initially, show all products
      emit(ProductSuccess(products: _filteredProducts));
    } catch (e) {
      emit(ProductFailure());
    }
  }

  //get the product Details by Id if needed.
  Future<Product?> getProductDetails(Product product) async {
    emit(ProductLoading());
    try {
      //if the product fetched correctly then return it otherwise Error
      final productDetails = await apiService.fetchProductById(product.id);
      return productDetails;
    } catch (e) {
      emit(ProductFailure());
      return null;
    }
  }

  // Method to filter products based on search query
  void filterProducts(String query) {
    emit(ProductLoading());
    if (query.isEmpty) {
      _filteredProducts = _allProducts; // Show all products if query is empty
    } else {
      _filteredProducts = _allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    if (_filteredProducts.isEmpty) {
      emit(NoProductsState()); // Emit no products state if none match
    } else {
      emit(ProductSuccess(
          products: _filteredProducts)); // Emit success with filtered products
    }
  }
}
