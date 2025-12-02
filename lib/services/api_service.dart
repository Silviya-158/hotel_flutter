import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/booking_model.dart';

class ApiService {
  // ✅ For Android Emulator
  static const String base = "http://localhost:8089/api";

  // 🏨 Fetch all bookings
  Future<List<BookingModel>> fetchBookings() async {
    final res = await http.get(
      Uri.parse('$base/bookings'),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => BookingModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  // 🆕 Create a booking
  Future<BookingModel> createBooking(BookingModel b) async {
    final res = await http.post(
      Uri.parse('$base/bookings'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(b.toJson()),
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      return BookingModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to create booking');
    }
  }

  // 🏩 Fetch rooms
  Future<List<dynamic>> fetchRooms() async {
    final res = await http.get(Uri.parse('$base/rooms'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to load rooms');
  }

  // 🍽️ Fetch dining items
  Future<List<dynamic>> fetchDining() async {
    final res = await http.get(Uri.parse('$base/dining'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to load dining');
  }

  // 💎 Fetch amenities
  Future<List<dynamic>> fetchAmenities() async {
    final res = await http.get(Uri.parse('$base/amenities'));
    if (res.statusCode == 200) return jsonDecode(res.body);
    throw Exception('Failed to load amenities');
  }
}