import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
              color: kBlacks,
            ),
          ),
        ],
      ),
    );
  }
}
