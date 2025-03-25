// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:grocery_app/view_model/product_view_model.dart';
import 'package:grocery_app/views/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the widget initializes
    Future.microtask(() =>
        Provider.of<ProductViewModel>(context, listen: false).loadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, productViewModel, child) {
        if (productViewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (productViewModel.products.isEmpty) {
          return const Center(child: Text("No products available"));
        }
        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productViewModel.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: productViewModel.products[index]);
            },
          ),
        );
      },
    );
  }
}
