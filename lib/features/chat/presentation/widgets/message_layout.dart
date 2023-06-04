import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class MessageLayout extends StatelessWidget {
  final String text;
  final String time;
  final Color color;
  final TextAlign align;
  final CrossAxisAlignment boxAlignment;
  final BubbleNip nip;
  final String senderName;
  final MainAxisAlignment boxMainAxisAlignment;
  final String pfpUrl;
  const MessageLayout({
    Key? key,
    required this.text,
    required this.time,
    required this.color,
    required this.align,
    required this.boxAlignment,
    required this.nip,
    required this.senderName,
    required this.boxMainAxisAlignment,
    required this.pfpUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(32)),
      child: Column(
        crossAxisAlignment: boxAlignment,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: boxMainAxisAlignment,
            children: [
              color == kLightGreys
                  ? Container(
                      height: getProportionateScreenHeight(32),
                      width: getProportionateScreenWidth(32),
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(14)),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))
                                  .copyWith(
                            bottomRight: const Radius.circular(0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(pfpUrl),
                            fit: BoxFit.cover,
                          )),
                    )
                  : const Text(
                      "",
                      style: TextStyle(fontSize: 0),
                    ),
              Bubble(
                color: color,
                nip: nip,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: getProportionateScreenWidth(146)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(8),
                          vertical: getProportionateScreenHeight(8),
                        ),
                        child: Text(
                          text == "" ? "" : text,
                          textAlign: align,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color:
                                    color == kLightGreys ? kBlacks : kBgColor,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              color != kLightGreys
                  ? Container(
                      height: getProportionateScreenHeight(32),
                      width: getProportionateScreenWidth(32),
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(14)),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)).copyWith(
                          bottomLeft: const Radius.circular(0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(pfpUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const Text(
                      "",
                      style: TextStyle(fontSize: 0),
                    ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(6)),
          Text(
            time,
            textAlign: align,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kGreys,
                ),
          ),
        ],
      ),
    );
  }
}
