////////  Correct Code  ////////

// class ProductModel {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String category;
//   final bool isBestSelling;
//   final bool isExclusive; // ✅ Added for Exclusive Offers
//   final String unit;

//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.category,
//     this.isBestSelling = false,
//     this.isExclusive = false, // Default false
//     this.unit = "pcs",
//   });
// }

class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String unit;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.unit = "pcs",
  });

  // Convert ProductModel to Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "price": price,
      "category": category,
      "unit": unit,
    };
  }

  // Create ProductModel from Firestore document
  factory ProductModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductModel(
      id: id,
      name: map["name"],
      imageUrl: map["imageUrl"],
      price: (map["price"] as num).toDouble(), // Handling both int and double
      category: map["category"],
      unit: map["unit"] ?? "pcs", // Default value if null
    );
  }
}
