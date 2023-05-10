import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/controller/provider/app_provider.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class Setting_component extends StatefulWidget {
  const Setting_component({Key? key}) : super(key: key);

  @override
  State<Setting_component> createState() => _Setting_componentState();
}

class _Setting_componentState extends State<Setting_component> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> _formkey4 = GlobalKey<FormState>();
  GlobalKey<FormState> _formkey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchAccess_Provider>(context)
                .switchAccess_Model
                .Switchval ==
            false)
        ? Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text(
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: const Text(
                          "Upadate profile data",
                        ),
                        trailing: Switch(
                          value:
                              Provider.of<ProfileSwitchAccessProvider>(context)
                                  .profileSwitchAccess_Model
                                  .profileswitchaccess,
                          onChanged: (val) {
                            Provider.of<ProfileSwitchAccessProvider>(context,
                                    listen: false)
                                .open();
                          },
                        ),
                      ),
                      (Provider.of<ProfileAddvariable_Provider>(context)
                                  .profileAddVariable_Model
                                  .name !=
                              "")
                          ? Container(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        foregroundImage:
                                            (Provider.of<ImagePicker_Provider>(
                                                            context)
                                                        .image !=
                                                    null)
                                                ? FileImage(Provider.of<
                                                            ImagePicker_Provider>(
                                                        context)
                                                    .image as File)
                                                : null,
                                        radius: 60,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                StatefulBuilder(
                                              builder: (context, setState) =>
                                                  AlertDialog(
                                                title: Text("Add Image",
                                                    style: TextStyle(
                                                        color: (Provider.of<ThemeAccessProvider>(
                                                                        context)
                                                                    .themeAccess_Model
                                                                    .isdarkaccess ==
                                                                false)
                                                            ? Colors.black
                                                            : Colors.white),),
                                                actions: [
                                                  Row(
                                                    children: [
                                                      ElevatedButton.icon(
                                                        onPressed: () {
                                                          Provider.of<ImagePicker_Provider>(
                                                                  context,
                                                                  listen: false)
                                                              .getImageFromcamera();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .camera_alt_outlined,
                                                        ),
                                                        label: const Text(
                                                          "Camera",
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      ElevatedButton.icon(
                                                        onPressed: () {
                                                          Provider.of<ImagePicker_Provider>(
                                                                  context,
                                                                  listen: false)
                                                              .getImageFromgallery();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                          Icons.photo,
                                                        ),
                                                        label: const Text(
                                                          "Gallary",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.camera,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${Provider.of<ProfileAddvariable_Provider>(context).profileAddVariable_Model.name}",
                                    style: (Provider.of<ThemeAccessProvider>(
                                                context,
                                                listen: false)
                                            .themeAccess_Model
                                            .isdarkaccess)
                                        ? Texttheme.textStylewhite
                                        : Texttheme.textstyleblack,
                                  ),
                                  Text(
                                    "${Provider.of<ProfileAddvariable_Provider>(context).profileAddVariable_Model.bio}",
                                    style: (Provider.of<ThemeAccessProvider>(
                                                context,
                                                listen: false)
                                            .themeAccess_Model
                                            .isdarkaccess)
                                        ? Texttheme.textStylewhite
                                        : Texttheme.textstyleblack,
                                  ),
                                ],
                              ),
                            )
                          : (Provider.of<ProfileSwitchAccessProvider>(context,
                                          listen: false)
                                      .profileSwitchAccess_Model
                                      .profileswitchaccess ==
                                  false)
                              ? Container()
                              : SingleChildScrollView(
                                  child: Form(
                                    key: _formkey3,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 70,
                                          child: const Icon(
                                              Icons.camera_alt_outlined),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: nameController,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter your name",
                                          ),
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Please enter your name";
                                              return null;
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: bioController,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            hintText: "Enter your bio",
                                            border: InputBorder.none,
                                          ),
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Please enter your bio";
                                              return null;
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                if (_formkey3.currentState!
                                                    .validate()) {
                                                  _formkey3.currentState!
                                                      .save();
                                                  Provider.of<ProfileAddvariable_Provider>(
                                                          context)
                                                      .add();
                                                }
                                              },
                                              child: const Text(
                                                "SAVE",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "CLEAR",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        trailing: Switch(
                          value: Provider.of<ThemeAccessProvider>(context)
                              .themeAccess_Model
                              .isdarkaccess,
                          onChanged: (val) {
                            Provider.of<ThemeAccessProvider>(context,
                                    listen: false)
                                .ChangeTheme();
                          },
                        ),
                        subtitle: const Text(
                          "Change Theme",
                        ),
                        title: const Text(
                          "Theme",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: const Icon(
                          Icons.sunny,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 110,
                ),
                CupertinoListTile(
                  leading: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.person_fill,
                    ),
                  ),
                  subtitle: const Text(
                    "Update profile data",
                    style: TextStyle(fontSize: 16),
                  ),
                  title: Text(
                    "Profile",
                    style: (Provider.of<ThemeAccessProvider>(context)
                                .themeAccess_Model
                                .isdarkaccess ==
                            false)
                        ? Texttheme.textstyleblack
                        : Texttheme.textStylewhite,
                  ),
                  trailing: CupertinoSwitch(
                      value: Provider.of<ProfileSwitchAccessProvider>(
                        context,
                      ).profileSwitchAccess_Model.profileswitchaccess,
                      onChanged: (val) {
                        Provider.of<ProfileSwitchAccessProvider>(context,
                                listen: false)
                            .open();
                      }),
                ),
                (Provider.of<ProfileAddvariable_Provider>(context,
                                listen: false)
                            .profileAddVariable_Model
                            .name !=
                        "")
                    ? Container(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  foregroundImage:
                                      (Provider.of<ImagePicker_Provider>(
                                                      context)
                                                  .image !=
                                              null)
                                          ? FileImage(
                                              Provider.of<ImagePicker_Provider>(
                                                      context)
                                                  .image as File)
                                          : null,
                                  radius: 60,
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => StatefulBuilder(
                                        builder: (context, setState) =>
                                            AlertDialog(
                                          title:  Text(
                                            "Add Image",
                                            style: TextStyle(
                                                color: (Provider.of<ThemeAccessProvider>(
                                                    context)
                                                    .themeAccess_Model
                                                    .isdarkaccess ==
                                                    false)
                                                    ? CupertinoColors.black
                                                    : CupertinoColors.white),
                                          ),
                                          actions: [
                                            Row(
                                              children: [
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    Provider.of<ImagePicker_Provider>(
                                                            context,
                                                            listen: false)
                                                        .getImageFromcamera();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                      CupertinoIcons.camera),
                                                  label: const Text(
                                                    "Camera",
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                ElevatedButton.icon(
                                                  onPressed: () {
                                                    Provider.of<ImagePicker_Provider>(
                                                            context,
                                                            listen: false)
                                                        .getImageFromgallery();
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    CupertinoIcons.photo,
                                                  ),
                                                  label: const Text(
                                                    "Gallary",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.camera,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${Provider.of<ProfileAddvariable_Provider>(context).profileAddVariable_Model.name}",
                              style: (Provider.of<ThemeAccessProvider>(context,
                                          listen: false)
                                      .themeAccess_Model
                                      .isdarkaccess)
                                  ? Texttheme.textStylewhite
                                  : Texttheme.textstyleblack,
                            ),
                            Text(
                              "${Provider.of<ProfileAddvariable_Provider>(context).profileAddVariable_Model.bio}",
                              style: (Provider.of<ThemeAccessProvider>(context,
                                          listen: false)
                                      .themeAccess_Model
                                      .isdarkaccess)
                                  ? Texttheme.textStylewhite
                                  : Texttheme.textstyleblack,
                            ),
                          ],
                        ),
                      )
                    : (Provider.of<ProfileSwitchAccessProvider>(context,
                                    listen: false)
                                .profileSwitchAccess_Model
                                .profileswitchaccess ==
                            false)
                        ? Container()
                        : Form(
                            key: _formkey4,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CircleAvatar(
                                    radius: 70,
                                    child: const Icon(
                                      CupertinoIcons.camera,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CupertinoTextFormFieldRow(
                                    controller: nameController,
                                    textAlign: TextAlign.center,
                                    placeholder: "Enter your name...",
                                  ),
                                  CupertinoTextFormFieldRow(
                                    controller: bioController,
                                    textAlign: TextAlign.center,
                                    placeholder: "Enter your bio...",
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CupertinoButton(
                                          child: const Text(
                                            "SAVE",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          onPressed: () {
                                            if (_formkey4.currentState!
                                                .validate()) {
                                              _formkey4.currentState!.save();
                                              Provider.of<ProfileAddvariable_Provider>(
                                                      context,
                                                      listen: false)
                                                  .add();
                                            }
                                          }),
                                      CupertinoButton(
                                          child: const Text(
                                            "CLEAR",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Provider.of<ProfileAddvariable_Provider>(
                                                    context,
                                                    listen: false)
                                                .clear();
                                          }),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                (Provider.of<ThemeAccessProvider>(context)
                            .themeAccess_Model
                            .isdarkaccess ==
                        false)
                    ? CupertinoListTile(
                        leading: const Icon(CupertinoIcons.brightness),
                        title: const Text(
                          "Theme",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "Change Theme",
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: CupertinoSwitch(
                          value: (Provider.of<ThemeAccessProvider>(context)
                              .themeAccess_Model
                              .isdarkaccess),
                          onChanged: (val) {
                            Provider.of<ThemeAccessProvider>(context,
                                    listen: false)
                                .ChangeTheme();
                          },
                        ),
                      )
                    : CupertinoListTile(
                        leading: const Icon(CupertinoIcons.brightness),
                        title: const Text(
                          "Theme",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: const Text(
                          "Change Theme",
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: CupertinoSwitch(
                          value: (Provider.of<ThemeAccessProvider>(context)
                              .themeAccess_Model
                              .isdarkaccess),
                          onChanged: (val) {
                            Provider.of<ThemeAccessProvider>(context,
                                    listen: false)
                                .ChangeTheme();
                          },
                        ),
                      ),
              ],
            ),
          );
  }
}
