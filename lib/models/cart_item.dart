class CartItem {
  final int productId;
  final String title;
  final num price;
  int quantity; // Add quantity

  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    this.quantity = 1, // Default quantity is 1
  });

  // Method to increment quantity
  void increment() {
    quantity++;
  }

  // Method to decrement quantity
  void decrement() {
    quantity--;
  }
}
