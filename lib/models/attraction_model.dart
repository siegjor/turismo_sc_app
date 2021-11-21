class AttractionModel {
  AttractionModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.address,
    required this.city,
    required this.phoneNumber,
    required this.openingHours,
    required this.ticketPrice,
    required this.websiteUrl,
    required this.videoUrl,
    required this.mapsUrl,
  });

  late final int id;
  late final String name;
  late final String imagePath;
  late final String address;
  late final String city;
  late final String phoneNumber;
  late final String openingHours;
  late final String ticketPrice;
  late final String websiteUrl;
  late final String videoUrl;
  late final String mapsUrl;
  bool isFavorite = false;

  AttractionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['imagePath'];
    address = json['address'];
    city = json['city'];
    phoneNumber = json['phoneNumber'];
    openingHours = json['openingHours'];
    ticketPrice = json['ticketPrice'];
    websiteUrl = json['websiteUrl'];
    videoUrl = json['videoUrl'];
    mapsUrl = json['mapsUrl'];
  }
}
