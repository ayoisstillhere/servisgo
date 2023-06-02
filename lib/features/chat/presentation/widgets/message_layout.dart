import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:servisgo/constants.dart';
import 'package:servisgo/size_config.dart';

class MessageLayout extends StatelessWidget {
  final String text;
  final String time;
  final Color color;
  final TextAlign align;
  final CrossAxisAlignment boxAlignment;
  final BubbleNip nip;
  final String senderName;
  final MainAxisAlignment boxMainAxisAlignment;
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
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGVhZHNob3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
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
                              const BorderRadius.all(Radius.circular(8))
                                  .copyWith(
                            bottomLeft: const Radius.circular(0),
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aGVhZHNob3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"),
                          )),
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
