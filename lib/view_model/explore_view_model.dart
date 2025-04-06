import 'package:flutter/material.dart';
import 'package:grocery_app/models/beverages_model.dart';

import 'package:grocery_app/services/upload_explore_data.dart';

class BeveragesViewModel with ChangeNotifier {
  final BeveragesService _beveragesService = BeveragesService();

  List<BeverageModel> _beverages = [];
  bool _isLoading = false;

  List<BeverageModel> get beverages => _beverages;
  bool get isLoading => _isLoading;

  Future<void> loadBeverages() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<BeverageModel> existingBeverages =
          await _beveragesService.fetchBeverages();

      if (existingBeverages.isEmpty) {
        debugPrint("Beverages missing, uploading...");
        await _beveragesService.uploadBeverages();
        existingBeverages = await _beveragesService.fetchBeverages();
      }

      _beverages = existingBeverages;
    } catch (e) {
      debugPrint("Error loading beverages: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
