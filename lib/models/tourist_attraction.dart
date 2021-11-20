import 'package:flutter/widgets.dart';

class TouristAttraction {
  final int id;
  final String name;
  final String imagePath;
  final String address;
  final String phoneNumber;
  final String openingHours;
  final String website;
  final double ticketPrice;
  bool isFavorite = false;

  TouristAttraction(this.id, this.name, this.imagePath, this.address,
      this.phoneNumber, this.openingHours, this.website, this.ticketPrice);
}
