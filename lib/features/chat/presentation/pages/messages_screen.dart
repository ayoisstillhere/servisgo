import 'package:flutter/material.dart';
import '../../../../size_config.dart';

import '../widgets/message_tile.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key});
  final List messageData = [
    [
      "https://cdn.pixabay.com/photo/2021/03/21/13/28/woman-6112091_1280.jpg",
      "Judith Omole",
      "I'm on My Way",
      "17:38",
      2
    ],
    [
      "https://cdn.pixabay.com/photo/2020/01/20/17/30/look-4780865__480.jpg",
      "Stephen Anyanwu",
      "Yeah, sure!",
      "Yesterday",
      0
    ],
    [
      "https://images.unsplash.com/photo-1530785602389-07594beb8b73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fG5pZ2VyaWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
      "Blessing Ornu",
      "Thank you sir!",
      "26 Aug",
      0
    ],
    [
      "https://cdn.pixabay.com/photo/2018/10/11/15/35/angry-boy-3740043__480.jpg",
      "Tobi Odusayo",
      "You're Welcome!",
      "11 May",
      1
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(32),
        ),
        itemCount: messageData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(28)),
            child: MessageTile(
                imgUrl: messageData[index][0],
                name: messageData[index][1],
                lastMsg: messageData[index][2],
                time: messageData[index][3],
                noOfMessages: messageData[index][4]),
          );
        },
      ),
    );
  }
}
