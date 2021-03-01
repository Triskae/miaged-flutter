import 'package:Miaged/common/models/user-profil.dart';
import 'package:Miaged/services/abastraction/user-service-abstraction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String USERS = "users";

class UserService extends UserServiceAbstraction {
  String storedUid;

  @override
  void changePassword(String newPassword) async {
    if (newPassword != "password") {
      // Password est le mot de passe de base étant donné que les mots de passe sont chiffré en base.
      await FirebaseAuth.instance.currentUser.updatePassword(newPassword);
    }
  }

  @override
  void updateProfil(UserProfil userProfil) async {
    String uid = FirebaseAuth.instance.currentUser.uid;

    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection(USERS)
        .where('firebaseId', isEqualTo: uid)
        .get();
    if (userSnapshot.docs.length != null) {
      DocumentReference ref = userSnapshot.docs[0].reference;
      ref.update({
        'birthDate': Timestamp.fromDate(userProfil.birthDate),
        'adress': userProfil.adress,
        'postalCode': userProfil.postalCode,
        'town': userProfil.town
      });
    } else {
      await FirebaseFirestore.instance.collection(USERS).add({
        'birthDate': Timestamp.fromDate(userProfil.birthDate),
        'adress': userProfil.adress,
        'postalCode': userProfil.postalCode,
        'town': userProfil.town
      });
    }
  }

  @override
  Future<UserProfil> getUserProfil() async {
    String uid = FirebaseAuth.instance.currentUser.uid;

    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection(USERS)
        .where('firebaseId', isEqualTo: uid)
        .get();
    print(userSnapshot.docs);
    if (userSnapshot.docs.length != 0) {
      return UserProfil.fromSnapshot(userSnapshot.docs[0]);
    } else {
      return UserProfil(
          login: FirebaseAuth.instance.currentUser.email,
          adress: null,
          birthDate: null,
          password: 'password',
          postalCode: '',
          town: '');
    }
  }
}
