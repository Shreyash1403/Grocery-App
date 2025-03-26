class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String unit;
  final String description; // ✅ Add Description

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.unit = "pcs",
    required this.description, // ✅ Include in Constructor
  });

  // Convert ProductModel to Map (for Firestore)
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "price": price,
      "category": category,
      "unit": unit,
      "description": description, // ✅ Add to Firestore
    };
  }

  // Create ProductModel from Firestore document
  factory ProductModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductModel(
      id: id,
      name: map["name"],
      imageUrl: map["imageUrl"],
      price: (map["price"] as num).toDouble(), // Handle both int and double
      category: map["category"],
      unit: map["unit"] ?? "pcs", // Default value if null
      description: map["description"] ?? "", // ✅ Fetch Description
    );
  }
}


// class ProductModel {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final double price;
//   final String category;
//   final String unit;
  

//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.category,
//     this.unit = "pcs",
//   });

//   // Convert ProductModel to Map (for Firestore)
//   Map<String, dynamic> toMap() {
//     return {
//       "name": name,
//       "imageUrl": imageUrl,
//       "price": price,
//       "category": category,
//       "unit": unit,
//     };
//   }

//   // Create ProductModel from Firestore document
//   factory ProductModel.fromMap(Map<String, dynamic> map, String id) {
//     return ProductModel(
//       id: id,
//       name: map["name"],
//       imageUrl: map["imageUrl"],
//       price: (map["price"] as num).toDouble(), // Handling both int and double
//       category: map["category"],
//       unit: map["unit"] ?? "pcs", // Default value if null
//     );
//   }
// }
