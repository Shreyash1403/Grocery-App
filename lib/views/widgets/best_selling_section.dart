import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/models/best_selling_model.dart';
import 'package:grocery_app/view_model/product_view_model.dart';
import 'package:grocery_app/views/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Consumer<ProductViewModel>(
            builder: (context, productViewModel, child) {
              if (productViewModel.bestSelling.isEmpty &&
                  !productViewModel.isLoading) {
                productViewModel.loadBestSellingProducts();
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productViewModel.bestSelling.length,
                itemBuilder: (context, index) {
                  final bestSellingProduct =
                      productViewModel.bestSelling[index];
                  return ProductsCard(bestSellingProduct: bestSellingProduct);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductsCard extends StatelessWidget {
  final BestSellingModel bestSellingProduct;

  const ProductsCard({super.key, required this.bestSellingProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 17, top: 30, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(226, 226, 226, 1)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailScreen(product: bestSellingProduct);
                  },
                ),
              );
            },
            child: Center(
              child: Image.asset(
                bestSellingProduct.imageUrl,
                height: 70,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            bestSellingProduct.name,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              color: const Color.fromRGBO(24, 23, 37, 1),
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            bestSellingProduct.unit,
            style: GoogleFonts.dmSans(
              fontSize: 15,
              color: const Color.fromRGBO(124, 124, 124, 1),
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "₹${bestSellingProduct.price.toStringAsFixed(2)}",
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  color: const Color.fromRGBO(24, 23, 37, 1),
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
