import 'package:flutter/material.dart';

class AmenitiesScreen extends StatelessWidget {
  const AmenitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AmenityData> amenities = [
      _AmenityData(
        image: 'assets/images/pool.jpg',
        title: 'Infinity Pool',
        description: 'Heated rooftop pool with valley view.',
      ),
      _AmenityData(
        image: 'assets/images/spa.jpg',
        title: 'Spa & Wellness',
        description: 'Relaxing spa, sauna and massage therapy.',
      ),
      _AmenityData(
        image: 'assets/images/restaurant.jpg',
        title: 'Multi-Cuisine Restaurant',
        description: 'Fine dining with local & international dishes.',
      ),
      _AmenityData(
        image: 'assets/images/parking.jpg',
        title: 'Free Parking',
        description: 'Secure on-site parking for all guests.',
      ),
      _AmenityData(
        image: 'assets/images/wifi.jpg',
        title: 'High-Speed Wi-Fi',
        description: 'Free Wi-Fi across the property.',
      ),
      _AmenityData(
        image: 'assets/images/bar.jpg',
        title: 'Lounge & Bar',
        description: 'Cozy lounge with signature cocktails.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Amenities'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: amenities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final amenity = amenities[index];
            return AmenitiesCard(
              image: amenity.image,
              title: amenity.title,
              description: amenity.description,
            );
          },
        ),
      ),
    );
  }
}

class AmenitiesCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const AmenitiesCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 Top Image
          SizedBox(
            height: 90,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // 📌 Text Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityData {
  final String image;
  final String title;
  final String description;

  _AmenityData({
    required this.image,
    required this.title,
    required this.description,
  });
}