import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

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
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16),
                      vertical: getProportionateScreenHeight(16)),
                  height: getProportionateScreenHeight(56),
                  width: getProportionateScreenWidth(56),
                  decoration: BoxDecoration(
                    color: kLightGreys,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(16),
                    ),
                  ),
                  child: SvgPicture.asset("assets/icons/addIcon.svg"),
                ),
                Container(
                  height: getProportionateScreenHeight(56),
                  width: getProportionateScreenWidth(256),
                  decoration: BoxDecoration(
                    // color: kBgColor,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: kBlacks.withOpacity(0.06),
                          blurRadius: 30,
                          spreadRadius: 0,
                          offset: const Offset(0, 8)),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                right: getProportionateScreenWidth(72),
                                left: getProportionateScreenWidth(16)),
                            // fillColor: kBgColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            hintText: "Type Something...",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenHeight(16),
                            vertical: getProportionateScreenWidth(16),
                          ),
                          height: getProportionateScreenHeight(56),
                          width: getProportionateScreenWidth(56),
                          decoration: BoxDecoration(
                            color: kCallToAction,
                            borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(16),
                            ),
                          ),
                          child: SvgPicture.asset("assets/icons/Send.svg"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(height: getProportionateScreenHeight(58)),
        ],
      ),
    );
  }
}
