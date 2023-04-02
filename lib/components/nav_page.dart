import 'package:flutter/material.dart';
import 'package:servisgo/components/bottom_navbar.dart';

class NavPage extends StatelessWidget {
  const NavPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List navPages = [];
    return const Scaffold(
      body: PageView.builder(
        onPageChanged: ,
        itemCount: ,
        itemBuilder: ,
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
