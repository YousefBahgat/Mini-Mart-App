import 'package:hive/hive.dart';
import '../cart_item_adapter.dart';
import '../models/cart_item.dart';

class LocalStorageService {
  static late Box<CartItem> cartBox;

  static Future<void> init() async {
    // Registers the adapter for the `CartItem` model, allowing Hive to serialize and deserialize it.
    Hive.registerAdapter(CartItemAdapter());

    // Opens a Hive box named 'cart' to store and retrieve `CartItem` objects persistently.
    cartBox = await Hive.openBox<CartItem>('cart');
  }

  // Retrieves all the items currently stored in the 'cart' Hive box and returns them as a list.
  static List<CartItem> getCartItems() {
    return cartBox.values.toList();
  }

  // Adds an item to the cart or updates its quantity if it already exists.
  static void addToCart(CartItem item) {
    // Check if the item is already present in the cart using its unique productId.
    if (cartBox.containsKey(item.productId)) {
      // If the item exists, retrieve it.
      CartItem existingItem = cartBox.get(item.productId)!;
      // Increment the item's quantity using the `increment` method in `CartItem`.
      existingItem.increment();
      // Update the item in the Hive box with the new quantity.
      cartBox.put(item.productId, existingItem);
    } else {
      // If the item does not exist, add it to the Hive box with its productId as the key.
      cartBox.put(item.productId, item);
    }
  }

// Removes an item from the cart or updates its quantity to zero if applicable.
  static void removeFromCart(int productId) {
    // Check if the item exists in the cart using its productId.
    if (cartBox.containsKey(productId)) {
      // Retrieve the existing item from the cart.
      CartItem existingItem = cartBox.get(productId)!;
      // If the item's quantity is zero, remove it completely from the cart.
      if (existingItem.quantity == 0) {
        cartBox.delete(productId);
      } else {
        // Otherwise, update the item in the cart box.
        cartBox.put(productId, existingItem);
      }
    }
  }

// Updates an item's details in the cart box. This is a direct update.
  static void updateCartItem(CartItem item) {
    // Save or update the item in the Hive box using its productId as the key.
    // but `addToCart` already handles updates like incrementing quantity.
    cartBox.put(item.productId, item);
  }
}
