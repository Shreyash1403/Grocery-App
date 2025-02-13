import 'package:grocery_app/models/product_model.dart';

class ProductService {
  fetchUsers() {
    return [
      ProductModel(
        id: "1",
        name: "Organic Bananas",
        imageUrl: "assets/banana.png",
        price: 60.0,
        category: "Fruits",
      )
    ];
  }
}
