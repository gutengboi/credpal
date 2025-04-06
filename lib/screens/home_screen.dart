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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Header
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 20.0),
            //   color: const Color(0xFFDBE5F9),
            //   width: double.infinity,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             Text(
            //               'Pay later',
            //               style: TextStyle(
            //                 fontSize: 24,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Text(
            //               'everywhere',
            //               style: TextStyle(
            //                 fontSize: 24,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.end,
            //           children: [
            //             const Text(
            //               'Shopping limit: ₦0',
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 color: Colors.black87,
            //               ),
            //             ),
            //             const SizedBox(height: 8),
            //             Container(
            //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            //               decoration: BoxDecoration(
            //                 color: Colors.blue,
            //                 borderRadius: BorderRadius.circular(4),
            //               ),
            //               child: const Text(
            //                 'Activate Credit',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 12,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              color: const Color(0xFFDBE5F9),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Pay later',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [

                                Text(
                                  'everywhere',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: Colors.orange,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Shopping limit: ₦0',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Your logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF274FED),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Activate Credit',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar
                  SearchBarWidget(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                  ),

                  const SizedBox(height: 20),

                  Container(
                    color: const Color(0xFFF1F3FE),
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),

                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 15,
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
                  ),


                  const SizedBox(height: 30),

                  // Featured Merchants
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured Merchants",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("View all",
                          style: TextStyle(color: Colors.blue, fontSize: 15))
                    ],
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0,0), // Adjust the right padding value as needed
                    child: Wrap(
                      spacing: 25,
                      runSpacing: 20,
                      children: const [
                        MerchantItem(
                          name: "Justrite",
                          imageUrl: "assets/images/justrite.png",
                          showStatusIndicator: true,
                        ),
                        MerchantItem(
                          name: "Orile Restaurant",
                          imageUrl: "assets/images/Orile.png",
                          showStatusIndicator: true,
                        ),
                        MerchantItem(
                          name: "Slot",
                          imageUrl: "assets/images/slot.png",
                          showStatusIndicator: true,
                        ),
                        MerchantItem(
                          name: "Pointtek",
                          imageUrl: "assets/images/Pointtek.jpg",
                          showStatusIndicator: true,
                        ),
                        MerchantItem(
                          name: "ogabassey",
                          imageUrl: "assets/images/ogabassey.png",
                        ),
                        MerchantItem(
                          name: "Casper Stores",
                          imageUrl: "assets/images/Casper.png",
                          showStatusIndicator: false,
                        ),
                        MerchantItem(
                          name: "Dreamworks",
                          imageUrl: "assets/images/Dreamworks.png",
                          showStatusIndicator: false,
                        ),
                        MerchantItem(
                          name: "Hubmart",
                          imageUrl: "assets/images/Hubmart.png",
                          showStatusIndicator: true,
                        ),
                        MerchantItem(
                          name: "Just Used",
                          imageUrl: "assets/images/JustUsed.png",
                          showStatusIndicator: true,
                        ),
                        MerchantItem(
                          name: "Just fones",
                          imageUrl: "assets/images/Justfone.png",
                          showStatusIndicator: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
