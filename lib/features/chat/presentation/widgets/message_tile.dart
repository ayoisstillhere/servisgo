import 'package:flutter/material.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../home/domain/entities/partner_entity.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../pages/chat_screen.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.lastMsg,
    required this.time,
    required this.currentUser,
    required this.currentPartner,
  }) : super(key: key);
  final String imgUrl;
  final String name;
  final String lastMsg;
  final String time;
  final UserEntity currentUser;
  final PartnerEntity currentPartner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      partner: currentPartner,
                      user: currentUser,
                    )));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(48),
                    width: getProportionateScreenWidth(48),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(getProportionateScreenWidth(16)),
                        topRight:
                            Radius.circular(getProportionateScreenWidth(16)),
                        bottomLeft:
                            Radius.circular(getProportionateScreenWidth(16)),
                        bottomRight: const Radius.circular(0),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(getProportionateScreenWidth(16)),
                        topRight:
                            Radius.circular(getProportionateScreenWidth(16)),
                        bottomLeft:
                            Radius.circular(getProportionateScreenWidth(16)),
                        bottomRight: const Radius.circular(0),
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(8)),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          lastMsg,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGreys),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(48),
                child: Text(
                  time,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: kGreys),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(16)),
          const Divider()
        ],
      ),
    );
  }
}
