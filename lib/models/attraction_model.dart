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

  final int id;
  final String name;
  final String imagePath;
  final String address;
  final String city;
  final String phoneNumber;
  final String openingHours;
  final String ticketPrice;
  final String websiteUrl;
  final String videoUrl;
  final String mapsUrl;

  factory AttractionModel.fromJson(Map<String, dynamic> json) {
    return AttractionModel(
      id: json['id'] ?? json['id'],
      name: json['name'] ?? json['name'],
      imagePath: json['imagePath'] ?? json['imagePath'],
      address: json['address'] ?? json['address'],
      city: json['city'] ?? json['city'],
      phoneNumber: json['phoneNumber'] ?? json['phoneNumber'],
      openingHours: json['openingHours'] ?? json['openingHours'],
      ticketPrice: json['ticketPrice'] ?? json['ticketPrice'],
      websiteUrl: json['websiteUrl'] ?? json['websiteUrl'],
      videoUrl: json['videoUrl'] ?? json['videoUrl'],
      mapsUrl: json['mapsUrl'] ?? json['mapsUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['imagePath'] = imagePath;
    _data['address'] = address;
    _data['city'] = city;
    _data['phoneNumber'] = phoneNumber;
    _data['openingHours'] = openingHours;
    _data['ticketPrice'] = ticketPrice;
    _data['websiteUrl'] = websiteUrl;
    _data['videoUrl'] = videoUrl;
    _data['mapsUrl'] = mapsUrl;
    return _data;
  }
}
