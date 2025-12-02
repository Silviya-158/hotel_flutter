import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'booking_screen.dart';
class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});
  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  final api = ApiService();
  late Future<List<dynamic>> rooms;

  @override
  void initState() {
    super.initState();
    rooms = api.fetchRooms();
  }

  final List<Map<String, dynamic>> localRooms = [
    {
      'img': 'assets/images/room1.jpeg',
      'type': 'King Suite 1',
      'price': 12000,
      'features': ['Car Parking', 'Free WiFi', 'Pool Access', 'Breakfast Included']
    },
    {
      'img': 'assets/images/room2.jpeg',
      'type': 'King Suite 2',
      'price': 13500,
      'features': ['Balcony View', 'Mini Bar', '24x7 Room Service', 'Car Parking']
    },
    {
      'img': 'assets/images/room3.jpeg',
      'type': 'Queen Deluxe 1',
      'price': 9800,
      'features': ['Free WiFi', 'Garden View', 'TV & AC', 'Car Parking']
    },
    {
      'img': 'assets/images/room4.jpeg',
      'type': 'Queen Deluxe 2',
      'price': 10200,
      'features': ['Lake View', 'Pool Access', 'WiFi', 'Car Parking']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Luxury Rooms'),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
        centerTitle: true,
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
          itemCount: localRooms.length,
          itemBuilder: (context, index) {
            final r = localRooms[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 18),
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(r['img'], height: 200, width: double.infinity, fit: BoxFit.cover),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r['type'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "₹ ${r['price']} per night",
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 6,
                          children: List.generate(r['features'].length, (i) {
                            return Chip(
                              backgroundColor: Colors.blue.shade50,
                              label: Text(
                                r['features'][i],
                                style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookingScreen(

                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.hotel, color: Colors.white),
                            label: const Text('Book Now', style: TextStyle(color: Colors.white)),
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