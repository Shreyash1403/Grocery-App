import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery_app/view_model/product_view_model.dart';
import 'package:grocery_app/views/widgets/groceries_section.dart';
import 'package:grocery_app/views/widgets/best_selling_section.dart';
import 'package:grocery_app/views/widgets/product_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  final List<String> carouselImages = [
    "assets/carousel.png",
    "assets/carousel.png",
    "assets/carousel.png",
  ];

  List<dynamic> colorCards = [
    Color.fromRGBO(227, 177, 123, 1),
    Color.fromRGBO(100, 175, 127, 1),
    Color.fromRGBO(248, 164, 76, 1),
  ];

  List<Map<String, dynamic>> colorImages = [
    {
      'image': "assets/pulses.png",
      'text': 'Pulses',
    },
    {
      'image': "assets/rice.png",
      'text': 'Rice',
    },
    {
      'image': "assets/pulses.png",
      'text': 'Pulses',
    },
  ];

  @override
  void initState() {
    super.initState();

    /// Delay execution to avoid modifying state during build
    Future.microtask(() {
      final productViewModel =
          Provider.of<ProductViewModel>(context, listen: false);
      productViewModel.loadProducts();
      productViewModel.loadBestSellingProducts();
      productViewModel.loadGroceries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset("assets/login_logo.png"),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on),
                    Text(
                      "Pune, Maharashtra",
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: const Color.fromRGBO(76, 79, 77, 1),
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                    hintText: 'Search for products...',
                    hintStyle: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(124, 124, 124, 1),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(242, 243, 242, 1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(83, 177, 117, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Carousel Slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          _currentIndex = index;
                        },
                      );
                    },
                  ),
                  items: carouselImages.map(
                    (imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ).toList(),
                ),

                // Dots Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carouselImages.map((url) {
                    int index = carouselImages.indexOf(url);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.green
                            : Colors.grey.shade400,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Exclusive Offer",
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        color: const Color.fromRGBO(24, 23, 37, 1),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                ProductSection(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Best Selling",
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        color: const Color.fromRGBO(24, 23, 37, 1),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                BestSellingSection(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Groceries",
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        color: const Color.fromRGBO(24, 23, 37, 1),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(colorImages.length, (index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(right: 15),
                        height: 105,
                        width: 250,
                        decoration: BoxDecoration(
                          color: colorCards[index],
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 10),
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset(colorImages[index]['image']),
                            const SizedBox(width: 10),
                            Text(
                              colorImages[index]['text'],
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                GroceriesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
