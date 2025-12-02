class BookingModel {
  final int? id;
  final String checkin;
  final String checkout;
  final String room;
  final int nights;
  final double price;
  final String? promo;

  BookingModel({
    this.id,
    required this.checkin,
    required this.checkout,
    required this.room,
    required this.nights,
    required this.price,
    this.promo,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      checkin: json['checkin'],
      checkout: json['checkout'],
      room: json['room'],
      nights: json['nights'],
      price: (json['price'] as num).toDouble(),
      promo: json['promo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'checkin': checkin,
      'checkout': checkout,
      'room': room,
      'nights': nights,
      'price': price,
      'promo': promo,
    };
  }
}