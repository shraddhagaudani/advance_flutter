import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/models/app_model.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchAccess_Provider extends ChangeNotifier {
  SwitchAccess_Model switchAccess_Model;

  SwitchAccess_Provider({required this.switchAccess_Model});

  void Convertapp() async {
    switchAccess_Model.Switchval = !switchAccess_Model.Switchval;

    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('convertapp', switchAccess_Model.Switchval);
  }
}

class IntroAccessProvider extends ChangeNotifier {
  IntroAccess_Model introAccess_Model;

  IntroAccessProvider({
    required this.introAccess_Model,
  });

  void IntroAccessProviderTrueLogic() async {
    introAccess_Model.Introaccess = true;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool('introAccess', introAccess_Model.Introaccess);
  }

  void IntroAccessProviderFalseLogic() async {
    introAccess_Model.Introaccess = false;

    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool('introAccess', introAccess_Model.Introaccess);
  }
}

class SignUpAccessProvider extends ChangeNotifier {
  SignUpAccess_Model signUpAccess_Model;

  SignUpAccessProvider({required this.signUpAccess_Model});

  void SignUpAccessTrueLogicProvider() async {
    signUpAccess_Model.Signupaccess = true;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool('signupaccess', signUpAccess_Model.Signupaccess);
  }

  void SignUpAccessFalseLogicProvider() async {
    signUpAccess_Model.Signupaccess = false;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool('signupaccess', signUpAccess_Model.Signupaccess);
  }
}

class ThemeAccessProvider extends ChangeNotifier {
  ThemeAccess_Model themeAccess_Model;

  ThemeAccessProvider({required this.themeAccess_Model});

  void ChangeTheme() async {
    themeAccess_Model.isdarkaccess = !themeAccess_Model.isdarkaccess;

    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setBool('theme', themeAccess_Model.isdarkaccess);
  }
}

class ProfileSwitchAccessProvider extends ChangeNotifier {
  ProfileSwitchAccess_Model profileSwitchAccess_Model =
      ProfileSwitchAccess_Model(profileswitchaccess: false);

  void open() {
    profileSwitchAccess_Model.profileswitchaccess =
        !profileSwitchAccess_Model.profileswitchaccess;

    notifyListeners();
  }
}

class AddVariable_Provider extends ChangeNotifier {
  AddVariable_Model addVariable_Model;

  AddVariable_Provider({
    required this.addVariable_Model,
  });

  void Add() async {
    addVariable_Model.fullName = fullNameController.text;
    addVariable_Model.phoneNumber = phoneNumberController.text;
    addVariable_Model.chats = chatsController.text;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('FullName', addVariable_Model.fullName);
    await preferences.setString('phoneNumber', addVariable_Model.phoneNumber);
    await preferences.setString('Chats', addVariable_Model.chats);
    notifyListeners();
  }

  List<String> fullNameList = [];
  List<String> phoneNumberList = [];
  List<String> chatsList = [];

  void AddList() async {
    fullNameList.add(addVariable_Model.fullName);
    phoneNumberList.add(addVariable_Model.phoneNumber);
    chatsList.add(addVariable_Model.chats);

    fullNameController.clear();
    phoneNumberController.clear();
    chatsController.clear();

    notifyListeners();
  }
}

class ImagePicker_Provider extends ChangeNotifier {
  File? image;

  Future<void> getImageFromcamera() async {
    ImagePicker picker = ImagePicker();
    notifyListeners();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String? path = xFile!.path;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (xFile != null) {
      image = File(path);
      imageList.add(path);
    }
    notifyListeners();
  }

  Future<void> getImageFromgallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);

    String path = xFile!.path;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (xFile != null) {
      image = File(path);
      imageList.add(path);
      notifyListeners();
    }
  }

  clear() {
    image = null;
  }
}

class ProfileAddvariable_Provider extends ChangeNotifier {
  ProfileAddVariable_Model profileAddVariable_Model;

  ProfileAddvariable_Provider({required this.profileAddVariable_Model});

  void add() async {
    profileAddVariable_Model.name = nameController.text;
    profileAddVariable_Model.bio = bioController.text;

    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('name', profileAddVariable_Model.name);
    await preferences.setString('bio', profileAddVariable_Model.bio);


    notifyListeners();
  }

  void clear() async {
    nameController.clear();
    bioController.clear();
  }

}

class ProfileImagepicker_Provider extends ChangeNotifier{
  File? image;

  Future<void> getImageFromcamera() async {
    ImagePicker picker = ImagePicker();
    notifyListeners();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String? path = xFile!.path;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (xFile != null) {
      image = File(path);
      imageList.add(path);
    }
    notifyListeners();
  }

  Future<void> getImageFromgallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);

    String path = xFile!.path;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (xFile != null) {
      image = File(path);
      imageList.add(path);
      notifyListeners();
    }
  }

  clear() {
    image = null;
  }
}