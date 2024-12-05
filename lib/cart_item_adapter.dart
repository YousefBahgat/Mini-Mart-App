import 'package:hive/hive.dart';
import '../models/cart_item.dart';

// A custom Hive TypeAdapter to serialize and deserialize CartItem objects
// for storage in a Hive database.
class CartItemAdapter extends TypeAdapter<CartItem> {
  // Unique type identifier for this adapter.
  // This ID must be unique across all adapters in the application.
  @override
  final typeId = 1;

  // Reads a CartItem object from the binary format stored in Hive.
  @override
  CartItem read(BinaryReader reader) {
    // Deserializes the binary data into a CartItem instance by reading
    // the properties in the same order they were written.
    return CartItem(
      productId: reader.read(), // Read productId (int).
      title: reader.read(), // Read title (String).
      price: reader.read(), // Read price (num).
      quantity: reader.read(), // Read quantity (int).
    );
  }

  // Writes a CartItem object into binary format for storage in Hive.
  @override
  void write(BinaryWriter writer, CartItem obj) {
    // Serializes the CartItem properties in the same order they will be read.
    writer.write(obj.productId); // Write productId.
    writer.write(obj.title); // Write title.
    writer.write(obj.price); // Write price.
    writer.write(obj.quantity); // Write quantity.
  }
}
