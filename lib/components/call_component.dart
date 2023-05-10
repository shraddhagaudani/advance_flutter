import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/controller/provider/app_provider.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Call_component extends StatefulWidget {
  const Call_component({Key? key}) : super(key: key);

  @override
  State<Call_component> createState() => _Call_componentState();
}

class _Call_componentState extends State<Call_component> {
  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchAccess_Provider>(context, listen: false)
                .switchAccess_Model
                .Switchval ==
            false)
        ? (Provider.of<AddVariable_Provider>(context).phoneNumberList.isEmpty)
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No Calls yet...",
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
                                  trailing: IconButton(
                                    onPressed: () async {
                                      await launchUrl(
                                        Uri.parse(
                                            "tel:+91${Provider.of<AddVariable_Provider>(context, listen: false).addVariable_Model.phoneNumber[i]}"),
                                      );
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.phone_fill,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              )
        : (Provider.of<AddVariable_Provider>(context).phoneNumberList.isEmpty)?
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("No Calls yet...",style: (Provider.of<ThemeAccessProvider>(context).themeAccess_Model.isdarkaccess == false)?Texttheme.textstyleblack:Texttheme.textStylewhite,)
            ],
          ),
        ):Container(
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
                            style:
                            (Provider.of<ThemeAccessProvider>(context)
                                .themeAccess_Model
                                .isdarkaccess ==
                                false)
                                ? Texttheme.textstyleblack
                                : Texttheme.textStylewhite),
                        subtitle: Text(
                          "${Provider.of<AddVariable_Provider>(context).chatsList[i]}",
                          style:
                          (Provider.of<ThemeAccessProvider>(context)
                              .themeAccess_Model
                              .isdarkaccess ==
                              false)
                              ? Texttheme.textstyleblack
                              : Texttheme.textStylewhite,
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            Uri uri = Uri.parse(
                                "tel: +91${Provider.of<AddVariable_Provider>(context, listen: false).phoneNumberList[i]}");
                            try {
                              await launchUrl(uri);
                            } catch (e) {
                              print("Exception : $e");
                            }
                          },

                          // onPressed: () async {
                          //   await launchUrl(
                          //     Uri.parse(
                          //         "tel: +91${Provider.of<AddVariable_Provider>(context).phoneNumberList[i]}"),
                          //   );
                          // },
                          icon: const Icon(
                            CupertinoIcons.phone_fill,
                            color: Colors.green,
                          ),
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
