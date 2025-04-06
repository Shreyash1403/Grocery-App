import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/services/upload_explore_data.dart';
import 'package:grocery_app/view_model/explore_view_model.dart';
import 'package:provider/provider.dart';

class BeverageScreen extends StatefulWidget {
  const BeverageScreen({super.key});

  @override
  State<BeverageScreen> createState() => _BeverageScreenState();
}

class _BeverageScreenState extends State<BeverageScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BeveragesViewModel>(context, listen: false)
            .loadBeverages());
  }

  @override
  @override
  Widget build(BuildContext context) {
    final beverageProvider = Provider.of<BeveragesViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beverages'),
        centerTitle: true,
        leading: const BackButton(),
        actions: const [Icon(Icons.settings), SizedBox(width: 10)],
      ),
      body: beverageProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: beverageProvider.beverages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final item = beverageProvider.beverages[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(item.imageUrl, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.name,
                          style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(item.volume,
                            style: GoogleFonts.dmSans(
                                color: Colors.grey[600], fontSize: 14)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text('\$${item.price}',
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w700, fontSize: 18)),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: IconButton(
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
