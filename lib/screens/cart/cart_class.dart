class CartItem {
  // String product_id;

  final String? name;
  final String? price;
  final String? imageSrc;
  int quantity;
  int id;

  CartItem({required this.id, this.name, this.price, this.imageSrc, this.quantity = 1});
}
