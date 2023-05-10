import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurpleAccent,
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  );
}

class Texttheme {
  static TextStyle textstyleblack = const TextStyle(
    color:
    CupertinoColors.darkBackgroundGray,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  );

  static TextStyle textStylewhite = const TextStyle(
    color: CupertinoColors.lightBackgroundGray,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    decoration: TextDecoration.none,
  );
}

//add page:

List<String> imageList = [];

TextEditingController fullNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController chatsController = TextEditingController();


// setting_page:
List<String> imageList2 = [];
TextEditingController nameController = TextEditingController();
TextEditingController bioController = TextEditingController();
