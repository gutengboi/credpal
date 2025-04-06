import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dummy_products.dart';
import '../models/product.dart';
import '../widgets/merchant_item.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> filteredProducts = dummyProducts;
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    setState(() {
      filteredProducts = dummyProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Pay later everywhere',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Shopping limit: ₦0",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text("Activate Credit",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 20),

            // Product Grid
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: filteredProducts
                  .map((product) => ProductCard(
                        title: product.title,
                        price: product.price,
                        oldPrice: product.oldPrice,
                        tag: product.tag,
                        imageUrl: product.imageUrl,
                      ))
                  .toList(),
            ),

            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured Merchants",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("View all",
                    style: TextStyle(color: Colors.blue, fontSize: 13))
              ],
            ),
            const SizedBox(height: 16),

            Wrap(
              runSpacing: 16,
              spacing: 20,
              children: const [
                MerchantItem(name: "Justrite"),
                MerchantItem(name: "Orile Restaurant"),
                MerchantItem(name: "Slot"),
                MerchantItem(name: "Pointtek"),
                MerchantItem(name: "ogabassey"),
                MerchantItem(name: "Casper Stores"),
                MerchantItem(name: "Dreamworks"),
                MerchantItem(name: "Hubmart"),
                MerchantItem(name: "Just Used"),
                MerchantItem(name: "Just fones"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
