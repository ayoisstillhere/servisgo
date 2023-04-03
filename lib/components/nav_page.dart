import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../features/chat/presentation/pages/messages_screen.dart';
import '../features/history/presentation/pages/history_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/menu/presentation/pages/menu_screen.dart';
import '../features/tracker/presentation/pages/tracker_screen.dart';

import '../size_config.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navPages = [
      const HomeScreen(),
      const HistoryScreen(),
      const TrackerScreen(),
      MessagesScreen(),
      const MenuScreen(),
    ];
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: navPages,
      ),
      bottomNavigationBar: CupertinoTabBar(
        border: const Border(top: BorderSide.none),
        activeColor: kCallToAction,
        inactiveColor: kGreys,
        currentIndex: _page,
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? kDarkBgColor
                : kBgColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home_icon.svg",
              // ignore: deprecated_member_use
              color: _page == 0 ? kCallToAction : kGreys,
              width: getProportionateScreenWidth(24),
              height: getProportionateScreenHeight(24),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/history_icon.svg",
              // ignore: deprecated_member_use
              color: _page == 1 ? kCallToAction : kGreys,
              width: getProportionateScreenWidth(24),
              height: getProportionateScreenHeight(24),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Location_icon.svg",
              // ignore: deprecated_member_use
              color: _page == 2 ? kCallToAction : kGreys,
              width: getProportionateScreenWidth(24),
              height: getProportionateScreenHeight(24),
            ),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/chat_icon.svg",
              // ignore: deprecated_member_use
              color: _page == 3 ? kCallToAction : kGreys,
              width: getProportionateScreenWidth(24),
              height: getProportionateScreenHeight(24),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Menu_icon.svg",
              // ignore: deprecated_member_use
              color: _page == 4 ? kCallToAction : kGreys,
              width: getProportionateScreenWidth(24),
              height: getProportionateScreenHeight(24),
            ),
            label: 'Menu',
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
