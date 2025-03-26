import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/views/screens/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(left: 17, top: 30, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(226, 226, 226, 1)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
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
                    return ProductDetailScreen(
                      product: product,
                    );
                  },
                ),
              );
            },
            child: Center(
              child: Image.asset(product.imageUrl,
                  height: 70, width: 100, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 25),
          Text(
            product.name,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              color: const Color.fromRGBO(24, 23, 37, 1),
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            product.unit,
            style: GoogleFonts.dmSans(
              fontSize: 15,
              color: const Color.fromRGBO(124, 124, 124, 1),
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "₹${product.price.toStringAsFixed(2)}",
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  color: const Color.fromRGBO(24, 23, 37, 1),
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.green),
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
