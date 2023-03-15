
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import 'navbar_button.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: kOutlineVariant),
        ),
      ),
      padding:
          EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavbarButton(
            iconUrl: "assets/icons/home_icon.svg",
            label: "Home",
            press: () {},
          ),
          NavbarButton(
            iconUrl: "assets/icons/history_icon.svg",
            label: "History",
            press: () {},
          ),
          NavbarButton(
            iconUrl: "assets/icons/Location_icon.svg",
            label: "Tracker",
            press: () {},
          ),
          NavbarButton(
            iconUrl: "assets/icons/chat_icon.svg",
            label: "Chat",
            press: () {},
          ),
          NavbarButton(
            iconUrl: "assets/icons/Menu_icon.svg",
            label: "Menu",
            press: () {},
          ),
        ],
      ),
    );
  }
}
