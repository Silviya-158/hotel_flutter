import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/rooms_screen.dart';
import 'screens/dining_screen.dart';
import 'screens/amenities_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/booking_screen.dart';

void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lee Falls Mansion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MainAppScreen(),
    );
  }
}

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});
  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;
  final _pages = const [
    HomeScreen(),
    RoomsScreen(),
    DiningScreen(),
    AmenitiesScreen(),
    BookingScreen(),
  ];

  void _onTap(int idx) => setState(() => _selectedIndex = idx);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bed), label: 'Rooms'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Dining'),
          BottomNavigationBarItem(icon: Icon(Icons.spa), label: 'Amenities'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Booking'),
        ],
      ),
    );
  }
}