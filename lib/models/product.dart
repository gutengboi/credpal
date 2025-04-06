class Product {
  final String title;
  final String price;
  final String oldPrice;
  final String? tag;
  final String imageUrl;

  Product({
    required this.title,
    required this.price,
    required this.oldPrice,
    this.tag,
    required this.imageUrl,
  });
}
