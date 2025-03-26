// class BestSellingModel {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String unit;

//   BestSellingModel({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     this.unit = "pcs",
//   });

//   /// Convert `BestSellingModel` to JSON (for Firestore)
//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "imageUrl": imageUrl,
//       "price": price,
//       "unit": unit,
//     };
//   }

//   /// Create `BestSellingModel` from Firestore document
//   factory BestSellingModel.fromJson(Map<String, dynamic> json, String id) {
//     return BestSellingModel(
//       id: id,
//       name: json["name"],
//       imageUrl: json["imageUrl"],
//       price: json["price"].toDouble(),
//       unit: json["unit"],
//     );
//   }
// }

class BestSellingModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String unit;
  final String description; // Added description field

  BestSellingModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.unit = "pcs",
    required this.description, // Required description
  });

  /// Convert `BestSellingModel` to JSON (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "price": price,
      "unit": unit,
      "description": description, // Store description in Firestore
    };
  }

  /// Create `BestSellingModel` from Firestore document
  factory BestSellingModel.fromJson(Map<String, dynamic> json, String id) {
    return BestSellingModel(
      id: id,
      name: json["name"],
      imageUrl: json["imageUrl"],
      price: (json["price"] as num).toDouble(),
      unit: json["unit"] ?? "pcs",
      description: json["description"] ??
          "No description available.", // Default description
    );
  }
}
