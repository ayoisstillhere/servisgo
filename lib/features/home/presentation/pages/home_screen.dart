import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
