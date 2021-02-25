import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aion/src/helper/user_helper.dart';

class UserData {
  final String userId;
  final String name;
  final String imageUrl;
  final String niNumber;
  final String emailId;
  final String mobileNumber;
  DocumentReference reference;

  UserData({
    this.name,
    this.imageUrl,
    this.mobileNumber,
    this.niNumber,
    this.userId,
    this.emailId,
  });

  factory UserData.fromJson(Map<dynamic, dynamic> json) =>
      vaccinationFromJson(json);

  Map<String, dynamic> toJson() => vaccinationToJson(this);
  @override
  String toString() => "Vaccination<$vaccination>";
}
