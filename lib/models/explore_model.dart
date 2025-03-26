class ExploreModel {
  final String id;
  final String title;
  final String image;

  ExploreModel({required this.id, required this.title, required this.image});

  // Convert to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "image": image,
    };
  }

  // Create `ExploreModel` from Firebase data
  factory ExploreModel.fromJson(Map<String, dynamic> json, String id) {
    return ExploreModel(
      id: id,
      title: json["title"],
      image: json["image"],
    );
  }
}
