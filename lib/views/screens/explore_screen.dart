// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/views/screens/beverage_screen.dart';
import 'package:grocery_app/views/screens/dairy_screen.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final List<Map<String, String>> categories = [
    {'title': 'Fresh Fruits & Vegetable', 'image': 'assets/fresh_fruit.png'},
    {'title': 'Cooking Oil & Ghee', 'image': 'assets/cooking_oil.png'},
    {'title': 'Meat & Fish', 'image': 'assets/meat.png'},
    {'title': 'Bakery & Snacks', 'image': 'assets/snacks.png'},
    {'title': 'Dairy & Eggs', 'image': 'assets/dairy.png'},
    {'title': 'Beverages', 'image': 'assets/beverages.png'},
  ];

  List<dynamic> colorList = [
    Color.fromRGBO(83, 177, 117, 0.1),
    Color.fromRGBO(248, 164, 76, 0.1),
    Color.fromRGBO(247, 165, 147, 0.25),
    Color.fromRGBO(211, 176, 224, 0.25),
    Color.fromRGBO(253, 229, 152, 0.25),
    Color.fromRGBO(183, 223, 245, 0.25),
  ];

  final Map<String, Widget> categoryScreens = {
    // 'Fresh Fruits & Vegetable': FreshFruitsScreen(),
    // 'Cooking Oil & Ghee': CookingOilScreen(),
    // 'Meat & Fish': MeatScreen(),
    // 'Bakery & Snacks': BakeryScreen(),
    'Dairy & Eggs': DairyScreen(),
    'Beverages': BeverageScreen(), // <- Your existing screen
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Store',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                      title: categories[index]['title']!,
                      image: categories[index]['image']!,
                      backgroundColor: colorList[index % colorList.length],
                      index: index,
                      onTap: () {
                        final selectedTitle = categories[index]['title'];
                        final screen = categoryScreens[selectedTitle];
                        if (screen != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => screen),
                          );
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final Color backgroundColor;
  final int index;
  final VoidCallback onTap;

  CategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.backgroundColor,
    required this.index,
    required this.onTap,
  });

  final List<Color> colorBorder = [
    Color.fromRGBO(83, 177, 117, 0.7),
    Color.fromRGBO(248, 164, 76, 0.7),
    Color.fromRGBO(247, 165, 147, 1),
    Color.fromRGBO(211, 176, 224, 1),
    Color.fromRGBO(253, 229, 152, 1),
    Color.fromRGBO(183, 223, 245, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorBorder[index % colorBorder.length]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 80),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
