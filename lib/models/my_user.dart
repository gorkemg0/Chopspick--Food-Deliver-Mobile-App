import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final String? userID;
  final String? email;
  String? userName;
  String? profilPhotoUrl;
  int? createdAt;
  String? adress;

  MyUser({required this.userID, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'userName':
          userName ?? email!.substring(0, email!.indexOf('@')).toLowerCase(),
      'profilPhotoUrl': profilPhotoUrl,
      'createdAt': createdAt ?? Timestamp.now().millisecondsSinceEpoch,
      'adress': adress,
    };
  }

  MyUser.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        profilPhotoUrl = map['profilPhotoUrl'],
        createdAt = map['createdAt'],
        adress = map['adress'];

  @override
  String toString() {
    return 'MyUser{userID: $userID, email: $email, userName: $userName, profilPhotoUrl: $profilPhotoUrl, createdAt: $createdAt, adress: $adress}';
  }
}
