import 'package:Miaged/common/custom-appbar.dart';
import 'package:Miaged/common/loading.dart';
import 'package:Miaged/common/models/user-profil.dart';
import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:Miaged/services/abastraction/user-service-abstraction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../service-locator.dart';

class Profil extends StatefulWidget {
  Profil({Key key}) : super(key: key);

  @override
  _ProfilPageWidgetState createState() => _ProfilPageWidgetState();
}

class _ProfilPageWidgetState extends State<Profil> {
  AuthServiceAbstraction _authService = locator<AuthServiceAbstraction>();
  UserServiceAbstraction _userService = locator<UserServiceAbstraction>();
  Future<UserProfil> profil;
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate;

  TextEditingController passwordController;
  TextEditingController birthdateController;
  TextEditingController adressController;
  TextEditingController postalCodeController;
  TextEditingController townController;

  Future<UserProfil> fetchProfil() async {
    UserProfil user = await _userService.getUserProfil();
    selectedDate = user.birthDate != null ? user.birthDate : DateTime.now();

    passwordController = TextEditingController(text: user.password);
    birthdateController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(selectedDate));
    adressController = TextEditingController(text: user.adress);
    postalCodeController = TextEditingController(text: user.postalCode);
    townController = TextEditingController(text: user.town);
    return user;
  }

  @override
  void initState() {
    super.initState();
    profil = fetchProfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
      ),
      body: FutureBuilder<UserProfil>(
        future: profil,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://lh3.googleusercontent.com/pE5dgP2JoUsdqmsqCVRmsUQutQ7FH80O4ajh_yH4LW2kj3W7vMmbe_-tpzduyy3tDA'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      snapshot.data.login,
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Mot de passe",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: birthdateController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Date de naissance",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: adressController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Adresse",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: postalCodeController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Code postal",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: Alignment(0, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          controller: townController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Ville",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: RaisedButton.icon(
                      onPressed: () {
                        _userService.updateProfil(UserProfil(
                            birthDate:
                                DateTime.parse(birthdateController.value.text),
                            adress: adressController.value.text,
                            postalCode: postalCodeController.value.text,
                            town: townController.value.text));
                        _userService.changePassword(passwordController.value.text);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      label: Text(
                        'Valider',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.blueGrey,
                      color: Colors.blueAccent,
                    ),
                  ),
                  RaisedButton.icon(
                    onPressed: () async {
                      await _authService.signOut();
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    label: Text(
                      'Se déconnecter',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    color: Colors.blueAccent,
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Loading();
          }
        },
      ),
    );
  }
}
