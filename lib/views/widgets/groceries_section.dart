import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/models/groceries_model.dart';
import 'package:grocery_app/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class GroceriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, productViewModel, child) {
        if (productViewModel.groceries.isEmpty && !productViewModel.isLoading) {
          productViewModel.groceries;
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 250, // Fixed height
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Horizontal scrolling
            itemCount: productViewModel.groceries.length,
            itemBuilder: (context, index) {
              final grocery = productViewModel.groceries[index];
              return GroceryCard(grocery: grocery);
            },
          ),
        );
      },
    );
  }
}

class GroceryCard extends StatelessWidget {
  final GroceriesModel grocery;

  const GroceryCard({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 17, top: 30, right: 15),
      // height: 250,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(226, 226, 226, 1)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              grocery.imageUrl,
              height: 70,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            grocery.name,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              color: const Color.fromRGBO(24, 23, 37, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            grocery.unit,
            style: GoogleFonts.dmSans(
              fontSize: 15,
              color: const Color.fromRGBO(124, 124, 124, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "₹${grocery.price.toStringAsFixed(2)}",
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  color: const Color.fromRGBO(24, 23, 37, 1),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: () {
                    // TODO: Implement add-to-cart functionality
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
