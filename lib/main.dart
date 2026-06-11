import 'package:flutter/material.dart';

void main() {
  runApp(const DealBlastApp());
}

class DealBlastApp extends StatelessWidget {
  const DealBlastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DealBlast',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
  TextEditingController();

  String searchResult = "";
  List<String> get filteredProducts {
    return allProducts
        .where(
          (product) => product.toLowerCase().contains(
        searchController.text.toLowerCase(),
      ),
    )
        .toList();
  }

  final List<Map<String, String>> deals = [
    {"title": "Nike Air Force", "discount": "60% OFF"},
    {"title": "RayBan", "discount": "40% OFF"},
    {"title": "Puma", "discount": "50% OFF"},
    {"title": "Adidas", "discount": "35% OFF"},
  ];

  final List<String> allProducts = [
    "Nike Air Force",
    "Nike Pegasus",
    "Nike Revolution",
    "Adidas Ultraboost",
    "Puma RS-X",
    "Jordan 1",
    "Apple Watch",
    "Rolex",
    "Casio G-Shock",
    "Titan Edge",
    "RayBan Aviator",
    "Oakley Holbrook",
    "Prada Black",
    "Gucci Square",
    "Tom Ford",
    "iPhone 15",
    "Samsung S25",
    "Google Pixel",
    "OnePlus 13",
    "Nothing Phone",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF833AB4),
              Color(0xFFFD1D1D),
              Color(0xFFFCAF45),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                const Text(
                  "🔥 DealBlast",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Discover Today's Best Deals",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search products...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                if (searchController.text.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: filteredProducts.isEmpty
                          ? [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "😔 Product Not Available da gandu\n\nWe'll notify you when available.\n\nThank you for using DealBlast. da loper",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]
                          : filteredProducts
                          .where(
                            (product) => product.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        ),
                      )
                          .map(
                            (product) => ListTile(
                          title: Text(product),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DealDetailsPage(
                                  title: product,
                                  discount: "50% OFF",
                                ),
                              ),
                            );
                          },
                        ),
                      )
                          .toList(),
                    ),
                  ),

                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "🎉 FLASH SALE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Nike Air Force - 60% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Limited Time Offer",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Trending Deals",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      dealCard(context, "👟", "Nike Air Force", "60% OFF"),
                      dealCard(context, "🕶", "RayBan", "40% OFF"),
                      dealCard(context, "⌚", "Apple Watch", "35% OFF"),
                      dealCard(context, "📱", "I Phone", "25% OFF"),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: deals.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.local_offer,
                                size: 50,
                                color: Colors.deepOrange,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                deals[index]["title"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                deals[index]["discount"]!,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Popular Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ActionChip(
                      label: const Text("⌚ Watches"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WatchesPage(),
                          ),
                        );
                      },
                    ),

                    ActionChip(
                      label: const Text("👟 Shoes"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShoesPage(),
                          ),
                        );
                      },
                    ),

                    ActionChip(
                      label: const Text("🕶 Sunglasses"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SunglassesPage(),
                          ),
                        );
                      },
                    ),

                    ActionChip(
                      label: const Text("📱 Electronics"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ElectronicsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                Text(
                  "🔥 Today's Hot Offers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.local_fire_department,
                          color: Colors.orange),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Diwali Mega Sale - Up to 80% OFF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.flash_on,
                          color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Electronics Weekend Deals",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
Widget dealCard(
    BuildContext context,
    String emoji,
    String title,
    String discount,
    ) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DealDetailsPage(
            title: title,
            discount: discount,
          ),
        ),
      );
    },
    child: Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            discount,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

class DealDetailsPage extends StatelessWidget {
  final String title;
  final String discount;

  const DealDetailsPage({
    super.key,
    required this.title,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "⭐⭐⭐⭐⭐ 4.8 Rating",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              discount,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Original Price: ₹60,000",
              style: TextStyle(
                fontSize: 18,
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Deal Price: ₹25,000",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "✓ Free Shipping",
            ),

            const SizedBox(height: 8),

            const Text(
              "✓ Trusted Seller",
            ),

            const SizedBox(height: 8),

            const Text(
              "✓ Limited Time Deal",
            ),

            const Text(
              "Limited Time Offer",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coupon Code",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "NIKE60",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "🎉 Coupon Claimed Successfully!",
                      ),
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutPage(),
                    ),
                  );
                },
                child: const Text(
                  "Claim Coupon",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class WatchesPage extends StatelessWidget {
  const WatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final watches = [
      "Apple Watch",
      "Rolex",
      "Casio G-Shock",
      "Titan Edge",
      "Fossil Gen 6",
      "Samsung Watch",
      "Garmin",
      "Noise ColorFit",
      "Boat Storm",
      "Fire-Boltt",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Watches"),
      ),
      body: ListView.builder(
        itemCount: watches.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.watch),
            title: Text(watches[index]),
          );
        },
      ),
    );
  }
}
class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final shoes = [
      "Nike Air Force",
      "Adidas Ultraboost",
      "Puma RS-X",
      "Jordan 1",
      "New Balance 574",
      "Reebok Classic",
      "Converse Chuck Taylor",
      "Vans Old Skool",
      "Skechers Go Walk",
      "Asics Gel Kayano",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Shoes")),
      body: ListView.builder(
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text(shoes[index]),
          );
        },
      ),
    );
  }
}
class SunglassesPage extends StatelessWidget {
  const SunglassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final glasses = [
      "RayBan Aviator",
      "Oakley Holbrook",
      "Prada Black",
      "Gucci Square",
      "Police Urban",
      "Tom Ford",
      "Versace Gold",
      "Carrera Classic",
      "Fastrack Shield",
      "Vincent Chase",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Sunglasses")),
      body: ListView.builder(
        itemCount: glasses.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.visibility),
            title: Text(glasses[index]),
          );
        },
      ),
    );
  }
}
class ElectronicsPage extends StatelessWidget {
  const ElectronicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final phones = [
      "iPhone 15",
      "Samsung S25",
      "Google Pixel",
      "OnePlus 13",
      "Nothing Phone",
      "Moto Edge",
      "Xiaomi 15",
      "Realme GT",
      "Vivo X200",
      "Oppo Find X",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Electronics")),
      body: ListView.builder(
        itemCount: phones.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.phone_android),
            title: Text(phones[index]),
          );
        },
      ),
    );
  }
}
class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nike Air Force",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Original Price: ₹60,000",
            ),

            const SizedBox(height: 10),

            const Text(
              "Discount: 60% OFF",
            ),

            const SizedBox(height: 10),

            const Text(
              "Final Price: ₹25,000",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "✅ Order Placed Successfully!",
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}