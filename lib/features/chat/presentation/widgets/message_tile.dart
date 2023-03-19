
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.lastMsg,
    required this.time,
    required this.noOfMessages,
  }) : super(key: key);
  final String imgUrl;
  final String name;
  final String lastMsg;
  final String time;
  final int noOfMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      topLeft: Radius.circular(getProportionateScreenWidth(16)),
                      topRight:
                          Radius.circular(getProportionateScreenWidth(16)),
                      bottomLeft:
                          Radius.circular(getProportionateScreenWidth(16)),
                      bottomRight: const Radius.circular(0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getProportionateScreenWidth(16)),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: kGreys),
                  ),
                  noOfMessages != 0
                      ? Container(
                          height: getProportionateScreenHeight(24),
                          width: getProportionateScreenWidth(24),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "$noOfMessages",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: kBgColor),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        const Divider()
      ],
    );
  }
}
