import 'package:flutter/material.dart';

class SwitchAccess_Model {
  bool Switchval;

  SwitchAccess_Model({required this.Switchval});
}

class IntroAccess_Model {
  bool Introaccess;

  IntroAccess_Model({
    required this.Introaccess,
  });
}

class SignUpAccess_Model {
  bool Signupaccess;

  SignUpAccess_Model({required this.Signupaccess});
}

class SignUp_Model {
  String? email;
  String? password;

  SignUp_Model({
    required this.email,
    required this.password,
  });
}

// class ThemeAccess_Model{
//
//   bool Darkthemeaccess;
//
//   ThemeAccess_Model({required this.Darkthemeaccess});
// }

// class ThemeAccess_Model{
//   bool isdarkaccess ;
//
//   ThemeAccess_Model({required this.isdarkaccess});
// }

class ThemeAccess_Model {
  bool isdarkaccess;

  ThemeAccess_Model({required this.isdarkaccess});
}

class ProfileSwitchAccess_Model {
  bool profileswitchaccess;

  ProfileSwitchAccess_Model({required this.profileswitchaccess});
}

class AddVariable_Model {
  String fullName;
  String phoneNumber;
  String chats;

  AddVariable_Model({
    required this.fullName,
    required this.phoneNumber,
    required this.chats,
  });
}

class ProfileAddVariable_Model {
  String name;
  String bio;


  ProfileAddVariable_Model(
      {required this.name, required this.bio});
}
