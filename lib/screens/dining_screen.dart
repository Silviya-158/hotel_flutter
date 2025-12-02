import 'package:flutter/material.dart';

class DiningScreen extends StatefulWidget {
  const DiningScreen({super.key});
  @override
  State<DiningScreen> createState() => _DiningScreenState();
}

class _DiningScreenState extends State<DiningScreen> {
  final List<Map<String, dynamic>> diningList = [
    {
      'name': 'The Waterfall Restaurant',
      'type': 'Multi-Cuisine Dining',
      'img': 'assets/images/dining1.jpg',
      'desc':
      'Savor flavors from around the world prepared by our expert chefs. Enjoy breakfast, lunch, or dinner by the soothing sound of waterfalls.',
      'specials': ['Italian Pasta', 'Indian Thali', 'Chinese Noodles']
    },
    {
      'name': 'Blue Lagoon Bar',
      'type': 'Signature Cocktails & Lounge',
      'img': 'assets/images/dining2.jpg',
      'desc':
      'Relax at our premium bar with crafted cocktails, live music, and cozy lighting that makes every evening memorable.',
      'specials': ['Mocktails', 'Classic Margarita', 'Fruit Punch']
    },
    {
      'name': 'Riverside Café',
      'type': 'Coffee • Snacks • Desserts',
      'img': 'assets/images/dining3.jpg',
      'desc':
      'Perfect spot for a quick bite or a romantic coffee date by the riverside. Try our special cheesecakes and cappuccino.',
      'specials': ['Cappuccino', 'Blueberry Cheesecake', 'Club Sandwich']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dining & Bar'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: diningList.length,
          itemBuilder: (context, index) {
            final d = diningList[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 20),
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(d['img'], height: 220, width: double.infinity, fit: BoxFit.cover),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          d['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          d['type'],
                          style: const TextStyle(fontSize: 15, color: Colors.black54),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          d['desc'],
                          style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Specials:',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 8,
                          children: List.generate(d['specials'].length, (i) {
                            return Chip(
                              backgroundColor: Colors.blue.shade50,
                              label: Text(
                                d['specials'][i],
                                style: const TextStyle(color: Colors.blueAccent),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Reservation feature coming soon for ${d['name']}!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            icon: const Icon(Icons.restaurant_menu, color: Colors.white),
                            label: const Text('Reserve Table', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}