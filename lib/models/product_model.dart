class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      category: json['category'],
    );
  }
}
