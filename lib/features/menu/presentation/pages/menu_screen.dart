import 'package:flutter/material.dart';
import 'package:servisgo/features/home/presentation/widgets/bottom_navbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
