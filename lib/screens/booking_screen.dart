import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/booking_model.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final api = ApiService();
  final _formKey = GlobalKey<FormState>();

  String _checkin = '';
  String _checkout = '';
  String _room = 'King Stay';
  String _promo = '';
  String _totalText = '';

  List<BookingModel> history = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      final list = await api.fetchBookings();
      setState(() => history = list);
    } catch (e) {
      debugPrint("Error loading bookings: $e");
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final checkinDate = DateTime.tryParse(_checkin);
    final checkoutDate = DateTime.tryParse(_checkout);

    if (checkinDate == null ||
        checkoutDate == null ||
        !checkoutDate.isAfter(checkinDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Check-out must be after check-in')),
      );
      return;
    }

    final nights = checkoutDate.difference(checkinDate).inDays;
    int rate = _room == 'King Stay' ? 5000 : 1000;
    double total = rate * nights.toDouble();
    if (_promo.trim().toUpperCase() == 'FALLS10') total *= 0.9;

    final booking = BookingModel(
      checkin: _checkin,
      checkout: _checkout,
      room: _room,
      nights: nights,
      price: total,
      promo: _promo.isEmpty ? null : _promo,
    );

    setState(() => _loading = true);
    try {
      final saved = await api.createBooking(booking);
      setState(() {
        history.add(saved);
        _totalText =
        '✅ Total: ₹${saved.price?.toStringAsFixed(0)} for ${saved.nights} night(s)';
      });
      _formKey.currentState!.reset();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Booking failed')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                    const InputDecoration(labelText: 'Check-in (yyyy-mm-dd)'),
                    validator: (v) =>
                    v == null || v.isEmpty ? 'Required' : null,
                    onSaved: (v) => _checkin = v!.trim(),
                  ),
                  TextFormField(
                    decoration:
                    const InputDecoration(labelText: 'Check-out (yyyy-mm-dd)'),
                    validator: (v) =>
                    v == null || v.isEmpty ? 'Required' : null,
                    onSaved: (v) => _checkout = v!.trim(),
                  ),
                  DropdownButtonFormField<String>(
                    value: _room,
                    items: const [
                      DropdownMenuItem(
                          value: 'King Stay',
                          child: Text('King Stay - ₹5000/night')),
                      DropdownMenuItem(
                          value: 'Queen Stay',
                          child: Text('Queen Stay - ₹1000/night')),
                    ],
                    onChanged: (v) => setState(() => _room = v!),
                    decoration: const InputDecoration(labelText: 'Room Type'),
                  ),
                  TextFormField(
                    decoration:
                    const InputDecoration(labelText: 'Promo (optional)'),
                    onSaved: (v) => _promo = v!.trim(),
                  ),
                  const SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: _loading ? null : _submit,
                    child: _loading
                        ? const CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2)
                        : const Text('Book Now'),
                  ),
                ],
              ),
            ),
            if (_totalText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _totalText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            const SizedBox(height: 18),
            const Text('Booking History',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            for (final b in history.reversed)
              Card(
                margin: const EdgeInsets.only(top: 8),
                child: ListTile(
                  title: Text('${b.room} — ₹${b.price?.toStringAsFixed(0)}'),
                  subtitle: Text(
                      'Check-in: ${b.checkin} | Check-out: ${b.checkout} | ${b.nights} night(s)'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}