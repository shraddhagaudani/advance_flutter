import 'dart:io';
import 'package:platform_convertor/controller/provider/app_provider.dart';
import 'package:platform_convertor/models/app_model.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:platform_convertor/views/screens/material/home_page.dart'
    as material;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:platform_convertor/utills/material3theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool Convertapp = await preferences.getBool('convertapp') ?? false;

  bool Introaccess = await preferences.getBool('introAccess') ?? false;

  bool signupaccess = await preferences.getBool('signupaccess') ?? false;

  String email = await preferences.getString('allemail') ?? "";
  String password = await preferences.getString('allpassword') ?? "";

  bool changetheme = await preferences.getBool('theme') ?? false;

  String fullName = await preferences.getString('FullName') ?? "";
  String phoneNumber = await preferences.getString('phoneNumber') ?? "";
  String chats = await preferences.getString('Chats') ?? "";

  String name = await preferences.getString('name') ?? "";
  String bio = await preferences.getString('bio') ?? "";

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImagePicker_Provider()),
        ChangeNotifierProvider(
            create: (context) => AddVariable_Provider(
                addVariable_Model: AddVariable_Model(
                    fullName: fullName,
                    phoneNumber: phoneNumber,
                    chats: chats))),
        ChangeNotifierProvider(
          create: (context) => SwitchAccess_Provider(
            switchAccess_Model: SwitchAccess_Model(
              Switchval: Convertapp,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => IntroAccessProvider(
            introAccess_Model: IntroAccess_Model(
              Introaccess: Introaccess,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpAccessProvider(
            signUpAccess_Model: SignUpAccess_Model(
              Signupaccess: signupaccess,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeAccessProvider(
            themeAccess_Model: ThemeAccess_Model(isdarkaccess: changetheme),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileSwitchAccessProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileAddvariable_Provider(
            profileAddVariable_Model:
                ProfileAddVariable_Model(name: name, bio: bio),
          ),
        ),
      ],
      builder: (context, _) {
        (Provider.of<SwitchAccess_Provider>(context)
                .switchAccess_Model
                .Switchval ==
            false);
        return (Platform.isAndroid)
            ? MaterialApp(
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: (Provider.of<ThemeAccessProvider>(context)
                            .themeAccess_Model
                            .isdarkaccess ==
                        false)
                    ? ThemeMode.light
                    : ThemeMode.dark,
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/': (context) => const material.Home_page(),
                },
              )
            : CupertinoApp(
                initialRoute: '/',
                theme: const CupertinoThemeData(
                  primaryColor: Colors.deepPurple,
                ),
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => const material.Home_page(),
                },
              );
      },
    ),
  );
}
