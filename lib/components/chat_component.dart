import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/controller/provider/app_provider.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:provider/provider.dart';

class Chat_component extends StatefulWidget {
  const Chat_component({Key? key}) : super(key: key);

  @override
  State<Chat_component> createState() => _Chat_componentState();
}

class _Chat_componentState extends State<Chat_component> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchAccess_Provider>(context, listen: false)
                .switchAccess_Model
                .Switchval ==
            false)
        ? (Provider.of<AddVariable_Provider>(context).chatsList.isEmpty)
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No Chats yet..."),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: Provider.of<AddVariable_Provider>(context,
                                  listen: false)
                              .fullNameList
                              .length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    foregroundImage: (imageList != null)
                                        ? (FileImage(File(imageList[i])))
                                        : (null),
                                  ),
                                  title: Text(
                                      "${Provider.of<AddVariable_Provider>(context).fullNameList[i]}"),
                                  subtitle: Text(
                                      "${Provider.of<AddVariable_Provider>(context).chatsList[i]}"),
                                  trailing: Text(
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}, ${TimeOfDay.now().hour}:${TimeOfDay.now().minute}"),
                                ),
                                Divider(),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              )
        : (Provider.of<AddVariable_Provider>(context).chatsList.isEmpty)
            ? Container(
      alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "No chats yet...",

                      style: (Provider.of<ThemeAccessProvider>(context)
                                  .themeAccess_Model
                                  .isdarkaccess ==
                              false)
                          ? Texttheme.textstyleblack
                          : Texttheme.textStylewhite,
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: Provider.of<AddVariable_Provider>(context,
                                  listen: false)
                              .fullNameList
                              .length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                CupertinoListTile(
                                  leading: CircleAvatar(
                                    foregroundImage: (imageList != null)
                                        ? (FileImage(File(imageList[i])))
                                        : (null),
                                  ),
                                  leadingSize: 40,
                                  title: Text(
                                      "${Provider.of<AddVariable_Provider>(context).fullNameList[i]}",
                                      style: (Provider.of<ThemeAccessProvider>(
                                                      context)
                                                  .themeAccess_Model
                                                  .isdarkaccess ==
                                              false)
                                          ? Texttheme.textstyleblack
                                          : Texttheme.textStylewhite),
                                  subtitle: Text(
                                    "${Provider.of<AddVariable_Provider>(context).chatsList[i]}",
                                    style: (Provider.of<ThemeAccessProvider>(
                                                    context)
                                                .themeAccess_Model
                                                .isdarkaccess ==
                                            false)
                                        ? Texttheme.textstyleblack
                                        : Texttheme.textStylewhite,
                                  ),
                                  trailing: Text(
                                    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}, ${DateTime.now().hour}:${DateTime.now().minute}",
                                    style: (Provider.of<ThemeAccessProvider>(
                                                    context)
                                                .themeAccess_Model
                                                .isdarkaccess ==
                                            false)
                                        ? Texttheme.textstyleblack
                                        : Texttheme.textStylewhite,
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              );
  }
}
