import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/explore_model.dart';

Future<void> uploadExploreCategories() async {
  final exploreCollection = FirebaseFirestore.instance.collection('explore');

  final List<ExploreModel> exploreCategories = [
    ExploreModel(
        id: '1',
        title: 'Fresh Fruits & Vegetable',
        image: 'assets/fresh_fruit.png'),
    ExploreModel(
        id: '2', title: 'Cooking Oil & Ghee', image: 'assets/cooking_oil.png'),
    ExploreModel(id: '3', title: 'Meat & Fish', image: 'assets/meat.png'),
    ExploreModel(id: '4', title: 'Bakery & Snacks', image: 'assets/snacks.png'),
    ExploreModel(id: '5', title: 'Dairy & Eggs', image: 'assets/dairy.png'),
    ExploreModel(id: '6', title: 'Beverages', image: 'assets/beverages.png'),
  ];

  for (var explore in exploreCategories) {
    await exploreCollection.add(explore.toJson());
  }
}
