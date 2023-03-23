import 'package:flutter/material.dart';
import '../../../../components/bottom_navbar.dart';

import '../widgets/no_results_body.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Map Unavailable",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: const NoResultsBody(),
    );
  }
}
