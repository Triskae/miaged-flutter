import 'package:Miaged/common/models/user-profil.dart';

abstract class UserServiceAbstraction {
  void changePassword(String newPassword);
  void updateProfil(UserProfil userProfil);
  Future<UserProfil> getUserProfil();
}
