import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfil {
  final String login;
  final String password;
  final DateTime birthDate;
  final String adress;
  final String postalCode;
  final String town;

  UserProfil({this.login, this.password, this.birthDate, this.adress, this.postalCode, this.town});
  factory UserProfil.fromSnapshot(DocumentSnapshot doc) {
    return UserProfil(
      login: doc.data()['login'],
      password: doc.data()['password'],
      adress: doc.data()['adress'],
      postalCode: doc.data()['postalCode'],
      town: doc.data()['town'],
      birthDate: doc.data()['birthDate'],
    );
  }


}
