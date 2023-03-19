import 'package:flutter/material.dart';
import 'package:servisgo/features/chat/presentation/pages/messages_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/menu/presentation/pages/menu_screen.dart';
import 'navbar_button.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(84),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: kOutlineVariant),
        ),
      ),
      padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavbarButton(
            iconUrl: "assets/icons/home_icon.svg",
            label: "Home",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          NavbarButton(
            iconUrl: "assets/icons/history_icon.svg",
            label: "History",
            press: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const HistoryScreen()));
            },
          ),
          NavbarButton(
            iconUrl: "assets/icons/Location_icon.svg",
            label: "Tracker",
            press: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const TrackerScreen()));
            },
          ),
          NavbarButton(
            iconUrl: "assets/icons/chat_icon.svg",
            label: "Chat",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagesScreen()));
            },
          ),
          NavbarButton(
            iconUrl: "assets/icons/Menu_icon.svg",
            label: "Menu",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()));
            },
          ),
        ],
      ),
    );
  }
}
