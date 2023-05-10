import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/components/adddetail_components.dart';
import 'package:platform_convertor/components/call_component.dart';
import 'package:platform_convertor/components/chat_component.dart';
import 'package:platform_convertor/components/setting_component.dart';
import 'package:platform_convertor/controller/provider/app_provider.dart';
import 'package:platform_convertor/utills/material3theme.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int intialIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return (Provider.of<SwitchAccess_Provider>(context)
                .switchAccess_Model
                .Switchval ==
            false)
        ? Scaffold(
            appBar: AppBar(
              title: const Text("Platform Convertor"),
              actions: [
                Switch(
                    value: Provider.of<SwitchAccess_Provider>(context)
                        .switchAccess_Model
                        .Switchval,
                    onChanged: (val) {
                      Provider.of<SwitchAccess_Provider>(
                        context,
                        listen: false,
                      ).Convertapp();
                    }),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: (val) {
                setState(() {
                  intialIndex = val;
                });
              },
              children: [
                Adddetail_component(),
                Chat_component(),
                Call_component(),
                Setting_component(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: intialIndex,
              onTap: (val) {
                setState(() {
                  intialIndex = val;
                  pageController.animateToPage(intialIndex,
                      duration: const Duration(
                        milliseconds: 800,
                      ),
                      curve: Curves.easeInOut);
                });
              },
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.deepPurple,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.person,
                  ),
                  label: "Add",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.chat,
                  ),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.call,
                    ),
                    label: "Call"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: "Setting"),
              ],
            ),
          )
        : CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: [
              BottomNavigationBarItem(
                label: "Add",
                icon: const Icon(CupertinoIcons.person),
              ),
              BottomNavigationBarItem(
                label: "Chat",
                icon: const Icon(CupertinoIcons.text_bubble),
              ),
              BottomNavigationBarItem(
                label: "call",
                icon: const Icon(CupertinoIcons.phone),
              ),
              BottomNavigationBarItem(
                label: "Setting",
                icon: const Icon(CupertinoIcons.settings),
              ),
            ]),
            tabBuilder: (context, i) {
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      backgroundColor: (Provider.of<ThemeAccessProvider>(
                                      context,
                                      listen: false)
                                  .themeAccess_Model
                                  .isdarkaccess ==
                              false)
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                      leading: Text(
                        "Platform Convertor",
                        style: (Provider.of<ThemeAccessProvider>(context,
                                        listen: false)
                                    .themeAccess_Model
                                    .isdarkaccess ==
                                false)
                            ? Texttheme.textstyleblack
                            : Texttheme.textStylewhite,
                      ),
                      trailing: CupertinoSwitch(
                        value: Provider.of<SwitchAccess_Provider>(context)
                            .switchAccess_Model
                            .Switchval,
                        onChanged: (val) {
                          Provider.of<SwitchAccess_Provider>(context,
                                  listen: false)
                              .Convertapp();
                        },
                      ),
                    ),
                    child: IndexedStack(
                      index: i,
                      children: [
                        Adddetail_component(),
                        Chat_component(),
                        Call_component(),
                        Setting_component(),
                      ],
                    ),
                  );
                },
              );
            });
  }
}
