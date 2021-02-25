import 'package:aion/src/config/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show GeoPoint;
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class LocationData {
  final String name;
  final String location;
  final LatLng geoPoint;

  LocationData({this.name, this.geoPoint, this.location});

  factory LocationData.fromJson(Map<dynamic, dynamic> json) => LocationData(
      name: json['Location'],
      geoPoint: convertGeoPoint(json['geoPoint']),
      location: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "Location": name,
        "geoPoint": GeoPoint(geoPoint.latitude, geoPoint.longitude),
        'name': location
      };

  @override
  String toString() => "User: <$name>";
}
