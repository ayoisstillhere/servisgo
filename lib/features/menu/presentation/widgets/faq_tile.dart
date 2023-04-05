
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class FAQTile extends StatefulWidget {
  const FAQTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final String question, answer;

  @override
  State<FAQTile> createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: getProportionateScreenHeight(8),
                width: getProportionateScreenWidth(8),
                decoration: BoxDecoration(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? kDarkPrimaryColor
                      : kPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(8)),
              Text(
                widget.question,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(16)),
          Visibility(
            visible: _isExpanded,
            child: Column(
              children: [
                Text(
                  widget.answer,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kGreys),
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
