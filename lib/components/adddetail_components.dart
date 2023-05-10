import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/controller/provider/app_provider.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:provider/provider.dart';

class Adddetail_component extends StatefulWidget {
  const Adddetail_component({Key? key}) : super(key: key);

  @override
  State<Adddetail_component> createState() => _Adddetail_componentState();
}

class _Adddetail_componentState extends State<Adddetail_component> {
  GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();

  File? image;

  DateTime initialDate = DateTime.now();
  DateTime? pickedDate;
  TimeOfDay initialTime = TimeOfDay.now();

  DateTime? pickTime2 = DateTime.now();

  DateTime initaialdate = DateTime.now();
  String periodname = (DateTime.now().hour >= 12) ? "pm" : "am";

  @override
  void initState() {
    super.initState();

    if (pickTime2 != null) {
      if (pickTime2!.hour >= 12) {
        periodname = "pm";
      } else {
        periodname = "am";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchAccess_Provider>(context, listen: false)
                .switchAccess_Model
                .Switchval ==
            false)
        ? Container(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formkey1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            foregroundImage: (Provider.of<ImagePicker_Provider>(
                                            context)
                                        .image !=
                                    null)
                                ? FileImage(
                                    Provider.of<ImagePicker_Provider>(context)
                                        .image as File)
                                : null,
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                  builder: (context, setState) => AlertDialog(
                                    title: const Text(
                                      "Add Image",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
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
                                              Icons.camera_alt_outlined,
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
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.camera_alt_outlined,
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
                              CupertinoIcons.camera,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: fullNameController,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter full name";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phoneNumberController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter phone number...";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          hintText: "Phone Number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: chatsController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please enter message...";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.chat),
                          hintText: "Chat Conversation",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              DateTime? date = await showDatePicker(
                                helpText: "Choose Date",
                                cancelText: "Dissmiss",
                                confirmText: "Confirm",
                                context: context,
                                initialDate: initialDate,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000),
                              );
                              setState(() {
                                if (date != pickedDate && date != null) {
                                  pickedDate = date;
                                }
                              });
                            },
                            icon: const Icon(Icons.date_range),
                          ),
                          (pickedDate != null)
                              ? Text(
                                  "${pickedDate?.day} - ${pickedDate?.month} - ${pickedDate?.year}",
                                )
                              : Text("Pick Date"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context, initialTime: initialTime);

                              if (pickedTime != null ||
                                  pickedTime != initialTime) {
                                setState(() {
                                  initialTime = pickedTime!;
                                });
                              }
                            },
                            icon: const Icon(Icons.watch_later_outlined),
                          ),
                          (initialTime.periodOffset == 0)
                              ? Text(
                                  "${initialTime.hour} :${initialTime.minute} ${initialTime.period.name}")
                              : Text(
                                  "${initialTime.hour - 12} :${initialTime.minute} ${initialTime.period.name}",
                                ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (Provider.of<ImagePicker_Provider>(context,
                                      listen: false)
                                  .image !=
                              null) {
                            if (_formkey1.currentState!.validate()) {
                              _formkey1.currentState!.save();
                              Provider.of<AddVariable_Provider>(context,
                                      listen: false)
                                  .Add();
                              Provider.of<AddVariable_Provider>(context,
                                      listen: false)
                                  .AddList();
                              Provider.of<ImagePicker_Provider>(context,
                                      listen: false)
                                  .clear();
                              setState(() {});
                            }
                          }
                        },
                        child: const Text(
                          "Save",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formkey2,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 110,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            foregroundImage: (Provider.of<ImagePicker_Provider>(
                                            context)
                                        .image !=
                                    null)
                                ? FileImage(
                                    Provider.of<ImagePicker_Provider>(context)
                                        .image as File)
                                : null,
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                  builder: (context, setState) => AlertDialog(
                                    title: const Text(
                                      "Add Image",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
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
                                              Icons.camera_alt_outlined,
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
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.camera_alt_outlined,
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
                        height: 40,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                          ),
                          Expanded(
                            child: CupertinoTextFormFieldRow(
                              controller: fullNameController,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CupertinoColors.inactiveGray),
                              ),
                              style: TextStyle(
                                color: (Provider.of<ThemeAccessProvider>(
                                                context,
                                                listen: false)
                                            .themeAccess_Model
                                            .isdarkaccess ==
                                        false)
                                    ? CupertinoColors.black
                                    : CupertinoColors.white,
                              ),
                              textInputAction: TextInputAction.next,
                              placeholder: "Full Name",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter full name..";
                                } else
                                  null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.phone,
                          ),
                          Expanded(
                            child: CupertinoTextFormFieldRow(
                              controller: phoneNumberController,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CupertinoColors.inactiveGray,
                                ),
                              ),
                              style: TextStyle(
                                color: (Provider.of<ThemeAccessProvider>(
                                                context,
                                                listen: false)
                                            .themeAccess_Model
                                            .isdarkaccess ==
                                        false)
                                    ? CupertinoColors.black
                                    : CupertinoColors.white,
                              ),
                              textInputAction: TextInputAction.next,
                              placeholder: "Phone Number",
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter phone number..";
                                } else
                                  null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(CupertinoIcons.text_bubble),
                          Expanded(
                            child: CupertinoTextFormFieldRow(
                              controller: chatsController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Please enter chat conversation..";
                                } else
                                  null;
                              },
                              textInputAction: TextInputAction.next,
                              placeholder: "Chat Conversation",
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CupertinoColors.inactiveGray),
                              ),
                              style: TextStyle(
                                color: (Provider.of<ThemeAccessProvider>(
                                                context,
                                                listen: false)
                                            .themeAccess_Model
                                            .isdarkaccess ==
                                        false)
                                    ? CupertinoColors.black
                                    : CupertinoColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => Container(
                                  height: 340,
                                  color: CupertinoColors.white,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    maximumYear: 3000,
                                    minimumYear: 2000,
                                    onDateTimeChanged: (val) {
                                      setState(() {
                                        initialDate = val;
                                      });
                                    },
                                    initialDateTime: initialDate,
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              CupertinoIcons.calendar,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              "${initialDate.day} / ${initialDate.month} / ${initialDate.year}",
                              style: (Provider.of<ThemeAccessProvider>(context,
                                              listen: false)
                                          .themeAccess_Model
                                          .isdarkaccess ==
                                      false)
                                  ? Texttheme.textstyleblack
                                  : Texttheme.textStylewhite),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => Container(
                                  height: 340,
                                  color: CupertinoColors.white,
                                  alignment: Alignment.center,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    use24hFormat: true,
                                    minimumYear: 2000,
                                    maximumYear: 3000,
                                    onDateTimeChanged: (val) {
                                      setState(() {
                                        pickTime2 = val;
                                        if (pickTime2 != null) {
                                          if (pickTime2!.hour >= 12) {
                                            periodname = "pm";
                                          } else {
                                            periodname = "am";
                                          }
                                        }
                                      });
                                      setState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              CupertinoIcons.time,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              "${pickTime2?.hour} : ${pickTime2?.minute} ${periodname}",
                              style: (Provider.of<ThemeAccessProvider>(context,
                                              listen: false)
                                          .themeAccess_Model
                                          .isdarkaccess ==
                                      false)
                                  ? Texttheme.textstyleblack
                                  : Texttheme.textStylewhite)
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CupertinoButton.filled(
                        onPressed: () {
                          if (Provider.of<ImagePicker_Provider>(context,
                                      listen: false)
                                  .image !=
                              null) {
                            if (_formkey2.currentState!.validate()) {
                              _formkey2.currentState!.save();
                              Provider.of<AddVariable_Provider>(context,
                                      listen: false)
                                  .Add();
                              Provider.of<AddVariable_Provider>(context,
                                      listen: false)
                                  .AddList();
                              Provider.of<ImagePicker_Provider>(context,
                                      listen: false)
                                  .clear();
                              setState(() {});
                            }
                          }
                        },
                        child: const Text("Save"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
