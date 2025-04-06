class BeverageModel {
  final String id;
  final String name;
  final String imageUrl;
  final String volume;
  final double price;

  BeverageModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.volume,
    required this.price,
  });

  factory BeverageModel.fromJson(Map<String, dynamic> json, String id) {
    return BeverageModel(
      id: id,
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      volume: json['volume'] ?? '',
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'volume': volume,
      'price': price,
    };
  }
}
