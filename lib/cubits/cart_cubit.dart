import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_item.dart';
import '../services/local_storage_service.dart';

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super(LocalStorageService.getCartItems());

  //method to add Item in cart
  void addToCart(CartItem item) {
    final existingItemIndex =
        state.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (existingItemIndex != -1) {
      // If the item already exists, increment its quantity
      state[existingItemIndex].increment();
      LocalStorageService.updateCartItem(
          state[existingItemIndex]); // Update in local storage
    } else {
      // Otherwise, add it to the cart
      LocalStorageService.addToCart(item);
    }

    emit(LocalStorageService.getCartItems()); // Emit updated cart
  }

  //method to remove item from cart
  void removeFromCart(int productId) {
    final existingItemIndex =
        state.indexWhere((item) => item.productId == productId);

    if (existingItemIndex != -1) {
      state[existingItemIndex].decrement();
      // Remove item from local storage if quantity is 0
      if (state[existingItemIndex].quantity == 0) {
        LocalStorageService.removeFromCart(productId);
        state.removeAt(existingItemIndex);
      } else {
        LocalStorageService.updateCartItem(
            state[existingItemIndex]); // Update in local storage
      }
    }

    emit(List.from(state)); // Emit updated cart
  }

  //get the total number if products in the cart
  int getTotalQuantity() {
    return state.fold(0, (sum, item) => sum + item.quantity);
  }
}
