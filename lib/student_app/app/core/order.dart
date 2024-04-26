class Order {
  int? id;
  String place;
  String video;
  String firstImage;
  String secondImage; // New field
  double latitude;
  double longitude;
  Order({
    this.id,
    required this.place,
    required this.video,
    required this.firstImage,
    required this.secondImage, // New field
    required this.latitude,
    required this.longitude,
  });

  // Convert Student object to a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'place': place,
      'video': video,
      'firstImage': firstImage,
      'secondImage': secondImage,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Convert a Map object to a Student object
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      place: map['place'],
      video: map['video'],
      firstImage: map['firstImage'],
      secondImage: map['secondImage'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
