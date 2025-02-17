import 'package:location/location.dart' as loc;

class LocationModel {
  final double? latitude;
  final double? longitude;

  LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromLocationData(loc.LocationData data) {
    return LocationModel(
      latitude: data.latitude ?? 0.0,
      longitude: data.longitude ?? 0.0,
    );
  }
}
