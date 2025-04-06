// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/explore_model.dart';

// Future<void> uploadExploreCategories() async {
//   final exploreCollection = FirebaseFirestore.instance.collection('explore');

//   final List<ExploreModel> exploreCategories = [
//     ExploreModel(
//         id: '1',
//         title: 'Fresh Fruits & Vegetable',
//         image: 'assets/fresh_fruit.png'),
//     ExploreModel(
//         id: '2', title: 'Cooking Oil & Ghee', image: 'assets/cooking_oil.png'),
//     ExploreModel(id: '3', title: 'Meat & Fish', image: 'assets/meat.png'),
//     ExploreModel(id: '4', title: 'Bakery & Snacks', image: 'assets/snacks.png'),
//     ExploreModel(id: '5', title: 'Dairy & Eggs', image: 'assets/dairy.png'),
//     ExploreModel(id: '6', title: 'Beverages', image: 'assets/beverages.png'),
//   ];

//   for (var explore in exploreCategories) {
//     await exploreCollection.add(explore.toJson());
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:grocery_app/models/beverages_model.dart';

class BeveragesService {
  final CollectionReference _beveragesRef =
      FirebaseFirestore.instance.collection('beverages');

  Future<void> uploadBeverages() async {
    final List<BeverageModel> beverageList = [
      BeverageModel(
          id: '1',
          name: "Diet Coke",
          imageUrl: 'assets/coke.png',
          volume: "355ml",
          price: 1.99),
      BeverageModel(
          id: '2',
          name: "Sprite Can",
          imageUrl: 'assets/sprite.png',
          volume: "325ml",
          price: 1.50),
      BeverageModel(
          id: '3',
          name: "Apple and Grape Juice",
          imageUrl: 'assets/grapes.png',
          volume: "2L",
          price: 15.99),
      BeverageModel(
          id: '4',
          name: "Orange Juice",
          imageUrl: 'assets/orange.png',
          volume: "2L",
          price: 15.99),
      BeverageModel(
          id: '5',
          name: "Coca Cola Can",
          imageUrl: 'assets/cola.png',
          volume: "325ml",
          price: 4.99),
      BeverageModel(
          id: '6',
          name: "Pepsi Can",
          imageUrl: 'assets/pepsi.png',
          volume: "330ml",
          price: 4.99),
    ];

    for (var beverage in beverageList) {
      await _beveragesRef.doc(beverage.id).set(beverage.toJson());
    }

    debugPrint("Beverages uploaded to Firestore!");
  }

  Future<List<BeverageModel>> fetchBeverages() async {
    final snapshot = await _beveragesRef.get();

    return snapshot.docs
        .map((doc) =>
            BeverageModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
