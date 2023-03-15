import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:servisgo/constants.dart';
import 'package:servisgo/size_config.dart';

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
