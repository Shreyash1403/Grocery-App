// class GroceriesModel {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String unit;

//   GroceriesModel({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     this.unit = "pcs",
//   });

//   /// Convert `GroceriesModel` to JSON (for Firestore)
//   Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "imageUrl": imageUrl,
//       "price": price,
//       "unit": unit,
//     };
//   }

//   /// Create `GroceriesModel` from Firestore document
//   factory GroceriesModel.fromJson(Map<String, dynamic> json, String id) {
//     return GroceriesModel(
//       id: id,
//       name: json["name"],
//       imageUrl: json["imageUrl"],
//       price: json["price"].toDouble(),
//       unit: json["unit"],
//     );
//   }
// }

class GroceriesModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String unit;
  final String description; // Added description field

  GroceriesModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.unit = "pcs",
    required this.description, // Initialize description
  });

  /// Convert `GroceriesModel` to JSON (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "price": price,
      "unit": unit,
      "description": description, // Include description in JSON
    };
  }

  /// Create `GroceriesModel` from Firestore document
  factory GroceriesModel.fromJson(Map<String, dynamic> json, String id) {
    return GroceriesModel(
      id: id,
      name: json["name"],
      imageUrl: json["imageUrl"],
      price: json["price"].toDouble(),
      unit: json["unit"] ?? "pcs",
      description: json["description"] ??
          "No description available.", // Default description
    );
  }
}
